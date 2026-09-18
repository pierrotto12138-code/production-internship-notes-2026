$ErrorActionPreference = 'Stop'
# 仓库根 = 本脚本所在目录（不写死绝对路径，换位置/改目录名都能用）
$root = $PSScriptRoot
if (-not $root) { $root = (Get-Location).Path }

function Join-Norm([string]$base, [string]$rel) {
    $parts = @()
    if ($base) { $parts = @($base -split '/' | Where-Object { $_ -ne '' }) }
    foreach ($seg in ($rel -split '/')) {
        if ($seg -eq '' -or $seg -eq '.') { continue }
        elseif ($seg -eq '..') {
            if ($parts.Count -ge 2) { $parts = $parts[0..($parts.Count-2)] }
            elseif ($parts.Count -eq 1) { $parts = @() }
        }
        else { $parts += $seg }
    }
    return ($parts -join '/')
}

$rx = [regex]'(!?\[[^\]]*\]\()([^)]+)(\))'
$files = Get-ChildItem -Path $root -Recurse -File -Include '*.md' |
    Where-Object { $_.FullName -notlike "*\_第三方资源\*" }

$total = 0; $bad = @(); $imgs = 0
foreach ($f in $files) {
    $rel  = $f.FullName.Substring($root.Length + 1).Replace('\', '/')
    $dir  = ($rel -split '/' | Select-Object -SkipLast 1) -join '/'
    $text = [System.IO.File]::ReadAllText($f.FullName)
    foreach ($m in $rx.Matches($text)) {
        $tgt = $m.Groups[2].Value.Trim()
        # 链接盲区写法：[t](<带空格路径>) 与 [t](路径 "标题")
        if ($tgt -match '^<(.*)>$') { $tgt = $Matches[1] }
        elseif ($tgt -match '^(\S+)\s+["(].*') { $tgt = $Matches[1] }
        if ($tgt -match '^[a-zA-Z][a-zA-Z0-9+.-]*://') { continue }
        if ($tgt.StartsWith('#')) { continue }
        $isImg = $m.Groups[1].Value.StartsWith('!')
        $path = ($tgt -split '#')[0]
        if ($path -eq '') { continue }
        $total++; if ($isImg) { $imgs++ }
        $abs  = Join-Norm $dir $path
        $full = Join-Path $root ($abs.Replace('/', '\'))
        if (-not (Test-Path -LiteralPath $full)) { $bad += "$rel`n      -> $tgt" }
    }
}
Write-Output "检查 .md 文件 $($files.Count) 个；相对链接 $total 处（其中图片 $imgs 处）"
if ($bad.Count -eq 0) { Write-Output "结果：全部可达，无断链 [OK]" }
else {
    Write-Output "结果：$($bad.Count) 处断链 [FAIL]"
    $bad | ForEach-Object { Write-Output "  $_" }
}
