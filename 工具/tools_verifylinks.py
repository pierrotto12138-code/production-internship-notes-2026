#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
tools_verifylinks.py —— tools_verifylinks.ps1 的跨平台等价实现（只读，可反复跑）。

解析仓库内每个 .md 的「[文字](链接)」与「![说明](图片路径)」，判断相对链接目标是否存在。
跳过：外链（http/https/file/mailto 等）、纯锚点 #、_第三方资源\\ 目录。
支持链接盲区写法：[t](路径 "标题") 与 [t](<带空格路径>)。

用法：
    python 工具/tools_verifylinks.py       # 任意 cwd 均可，仓库根 = 工具 目录的上一级
退出码：0 全部可达 / 1 有断链。
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RX = re.compile(r'(!?\[[^\]]*\]\()([^)]+)(\))')
SCHEME = re.compile(r'^[a-zA-Z][a-zA-Z0-9+.\-]*://')


def norm_join(base_dir: Path, rel: str) -> Path:
    parts = list(base_dir.parts)
    for seg in rel.split('/'):
        if seg in ('', '.'):
            continue
        if seg == '..':
            if parts:
                parts.pop()
        else:
            parts.append(seg)
    return Path(*parts) if parts else ROOT


def extract_target(raw: str) -> str:
    tgt = raw.strip()
    m = re.match(r'^<(.*)>$', tgt)          # [t](<path with spaces>)
    if m:
        return m.group(1).strip()
    m = re.match(r'^(\S+)\s+["(].*', tgt)   # [t](path "title")
    if m:
        return m.group(1)
    return tgt


def main() -> int:
    files = [p for p in sorted(ROOT.rglob('*.md'))
             if '_第三方资源' not in p.parts]
    total = imgs = 0
    bad = []
    for f in files:
        rel = f.relative_to(ROOT)
        text = f.read_text(encoding='utf-8', errors='replace')
        for m in RX.finditer(text):
            is_img = m.group(1).startswith('!')
            tgt = extract_target(m.group(2))
            if not tgt or SCHEME.match(tgt) or tgt.startswith('#'):
                continue
            path = tgt.split('#', 1)[0]
            if not path:
                continue
            total += 1
            imgs += is_img
            target = norm_join(ROOT / rel.parent, path.replace('\\', '/'))
            if not target.exists():
                bad.append(f'{rel.as_posix()}\n      -> {tgt}')
    print(f'检查 .md 文件 {len(files)} 个；相对链接 {total} 处（其中图片 {imgs} 处）')
    if not bad:
        print('结果：全部可达，无断链 [OK]')
        return 0
    print(f'结果：{len(bad)} 处断链 [FAIL]')
    for b in bad:
        print('  ' + b)
    return 1


if __name__ == '__main__':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass
    sys.exit(main())
