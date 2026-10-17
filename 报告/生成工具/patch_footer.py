# -*- coding: utf-8 -*-
"""把报告页脚里的“总页数”域 NUMPAGES 改为“本节页数”域 SECTIONPAGES，
使正文页脚显示 当前页/正文总页数（如 1/22 … 22/22）。只改页脚字段，不动正文。"""
import sys

from docx import Document
from docx.oxml.ns import qn

path = sys.argv[1]
doc = Document(path)

n = 0
for sec in doc.sections:
    for part in (sec.footer, sec.first_page_footer, sec.even_page_footer):
        try:
            el = part._element
        except Exception:
            continue
        for instr in el.iter(qn("w:instrText")):
            if instr.text and "NUMPAGES" in instr.text:
                instr.text = instr.text.replace("NUMPAGES", "SECTIONPAGES")
                n += 1
print("替换字段数:", n)
doc.save(path)
print("saved:", path)
