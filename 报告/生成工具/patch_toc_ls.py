# -*- coding: utf-8 -*-
"""原地修正另一位同学报告目录页码缓存（只改页码，不动其余格式）。
按当前渲染实测的正文页码回填。"""
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(HERE))
import pymupdf
from docx import Document
from docx.oxml.ns import qn

DOCX = str(ROOT / "报告" / "另一位同学报告_脱敏.docx")
PDF = str(HERE / "另一位同学报告_脱敏.pdf")

d = pymupdf.open(PDF)
foot = {}
for i, pg in enumerate(d):
    m = re.findall(r'(\d+)\s*/\s*(\d+)', pg.get_text())
    foot[i + 1] = m[-1][0] if m else None
body_start = min(i + 1 for i in range(len(d)) if foot[i + 1] == "1" and "第一章" in re.sub(r"\s+", "", d[i].get_text()))

doc = Document(DOCX)
changed = 0
for p in doc.paragraphs:
    st = (p.style.name if p.style else "").lower()
    if not st.startswith("toc") or p.text.strip() == "目录":
        continue
    raw = p.text
    key = re.sub(r"\s+", "", raw.rsplit("\t", 1)[0] if "\t" in raw else raw)
    hit = [i + 1 for i in range(body_start - 1, len(d)) if key in re.sub(r"\s+", "", d[i].get_text())]
    actual = foot[min(hit)] if hit else None
    if actual is None:
        print("  ?? 未能定位:", key)
        continue
    # 最后一个含 tab 的 run 之后的 w:t 即页码
    target = None
    for r in p._p.findall(".//" + qn("w:r")):
        if r.find(qn("w:tab")) is not None and r.find(qn("w:t")) is not None:
            target = r
    if target is None:
        print("  ?? 无页码 run:", key)
        continue
    t = target.find(qn("w:t"))
    old = t.text
    if old != str(actual):
        t.text = str(actual)
        changed += 1
        print("  %-24s %s -> %s" % (key, old, actual))
print("更新条数:", changed)
doc.save(DOCX)
print("已保存:", DOCX)
