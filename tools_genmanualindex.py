#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
tools_genmanualindex.py —— 为 _第三方资源\\ 下 21 本 ABB 手册各生成一份 `目录索引.md`
（章节名 → docN.html 对照表），把"对 13k 个 HTML 盲扫"变成"先查目录再定点打开"。

重生成命令（在仓库根或任意位置均可，路径自定位）：
    python tools_genmanualindex.py

说明：
- 目录来源：各手册的 toc.hhc（CHM 反编译目录，已确认为 UTF-8）；
  21_RobotStudio_API参考_NET_SDK 用其自带的 "RobotStudio API Reference.hhc"。
- 嵌套层级按 hhc 中 <UL> 深度缩进；链接保持相对手册目录的原始相对路径。
- 生成的 .md 在 _第三方资源\\ 下，不在链接校验范围内（该目录分享时整体剔除）。
"""
import html
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
HELP_DIRS = [ROOT / '_第三方资源' / '帮助文档_中文', ROOT / '_第三方资源' / '帮助文档_英文']

NAME_RX = re.compile(r'<param\s+name="Name"\s+value="([^"]*)"', re.I)
LOCAL_RX = re.compile(r'<param\s+name="(?:Local|JumpId)"\s+value="([^"]*)"', re.I)
UL_RX = re.compile(r'<\s*/?\s*UL\s*>', re.I)


def parse_hhc(path: Path):
    text = path.read_text(encoding='utf-8-sig', errors='replace')
    depth = 0
    pending_name = None
    entries = []
    for line in text.splitlines():
        for _ in re.findall(r'<\s*UL\s*>', line, re.I):
            depth += 1
        m = NAME_RX.search(line)
        if m:
            if pending_name is not None:
                entries.append((depth, html.unescape(pending_name), ''))  # heading without page
            pending_name = m.group(1)
        m = LOCAL_RX.search(line)
        if m and pending_name is not None:
            entries.append((depth, html.unescape(pending_name), html.unescape(m.group(1))))
            pending_name = None
        for _ in re.findall(r'<\s*/\s*UL\s*>', line, re.I):
            depth = max(0, depth - 1)
    if pending_name is not None:
        entries.append((depth, html.unescape(pending_name), ''))
    return entries


def gen_for_manual(manual_dir: Path) -> bool:
    hhc = manual_dir / 'toc.hhc'
    if not hhc.exists():
        cands = [p for p in manual_dir.glob('*.hhc')]
        if not cands:
            return False
        hhc = cands[0]
    entries = parse_hhc(hhc)
    if not entries:
        return False
    lines = [
        f'# {manual_dir.name} · 目录索引（自动生成）',
        '',
        f'> 由 `tools_genmanualindex.py` 从 `{hhc.name}` 生成，**勿手改**；重生成见脚本头部注释。',
        f'> 正文共 {sum(1 for _, _, u in entries if u)} 页可直达；链接相对本手册目录。',
        '',
    ]
    for depth, name, url in entries:
        indent = '  ' * max(0, depth - 1)
        if url:
            lines.append(f'{indent}- [{name}]({url})')
        else:
            lines.append(f'{indent}- **{name}**')
    (manual_dir / '目录索引.md').write_text('\n'.join(lines) + '\n', encoding='utf-8')
    return True


def main() -> int:
    ok, fail = 0, []
    for base in HELP_DIRS:
        if not base.exists():
            fail.append(str(base) + ' （目录不存在）')
            continue
        for d in sorted(p for p in base.iterdir() if p.is_dir()):
            if gen_for_manual(d):
                ok += 1
            else:
                fail.append(d.name)
    print(f'已生成目录索引：{ok} 本')
    if fail:
        print('未生成：' + '、'.join(fail))
        return 1
    return 0


if __name__ == '__main__':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass
    sys.exit(main())
