$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
if (-not $root) { $root = (Get-Location).Path }

# ============================================================
#  审计盲区补充检查：验证正文里「反引号写出的仓库内路径」是否真实存在
#  常规 tools_verifylinks.ps1 只查 [文字](链接) 形式，查不到这种写法。
#  （以下情况属预期，会被自动跳过：通配符、模板占位、目录名、旧路径对照表）
# ============================================================

$topDirs = @('配图','机器视觉实训','机器人实训','汇报材料','_第三方资源')
$rx = [regex]'`([^`\n]+)`'

$files = Get-ChildItem -Path $root -Recurse -File -Include '*.md' |
    Where-Object { $_.FullName -notlike '*_第三方资源*' }

$missing = @(); $checked = 0
foreach ($f in $files) {
    $rel = $f.FullName.Substring($root.Length + 1)
    $lines = [System.IO.File]::ReadAllText($f.FullName) -split "`r?`n"
    foreach ($line in $lines) {
        # 跳过 7.1「旧路径 → 新路径」对照表（旧路径本就不存在）
        if ($line -match '^\s*\|' -and $line -match '→|->') { continue }
        if ($line -match '^\s*\|.*\|.*\|' -and $line -match '`[^`]*(编程实训|知识随记|Study_Images|VMKBImages|README_索引)') { continue }
        foreach ($m in $rx.Matches($line)) {
            $cand = $m.Groups[1].Value.Trim()
            $cand = ($cand -split '\s+')[0]
            if ($cand -notmatch '[\\/]') { continue }
            if ($cand -match '\*') { continue }                  # 通配符
            if ($cand -match 'DayN|MMDD|xxx|XXX|\.\.\.') { continue }  # 模板占位
            $first = ($cand -split '[\\/]')[0]
            if ($topDirs -notcontains $first) { continue }
            $p = $cand.Replace('/', '\').TrimEnd('\', '"', "'")
            $checked++
            # 目录引用：去掉末段再试一次
            $full = Join-Path $root $p
            if (-not (Test-Path -LiteralPath $full)) {
                $parent = Join-Path $root (Split-Path -Parent $p)
                if (-not (Test-Path -LiteralPath $parent)) {
                    $missing += "$rel`n      -> $cand"
                }
            }
        }
    }
}
Write-Output "检查「反引号内仓库路径」$checked 处"
if ($missing.Count -eq 0) { Write-Output "[OK] 全部存在" }
else {
    Write-Output "[注意] $($missing.Count) 处指向不存在的路径："
    $missing | ForEach-Object { Write-Output "  $_" }
}
