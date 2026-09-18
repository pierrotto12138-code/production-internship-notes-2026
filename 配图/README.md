# 配图目录 · 真实映射表（重要，先看这里）

> ⚠️ **免责声明**：本仓库全部内容为基于个人学习记录**由 AI 自主整合**的版本，**未经人工优化**，仅供学习内容参考；如照搬全抄造成课程成绩损失，概不负责。

> 本目录集中存放**全部笔记的配图**，笔记用相对路径引用（`../../配图/…`）。
> **请勿删除或改名任何图片与子目录**——改名 = 全库上百处引用断裂。

---

## 一、DayN 目录 ↔ 实际日期映射（历史命名，与字面"第 N 天"不一致）

`DayN_images` 的编号是历史遗留，**不能按字面理解**（不是"实习第 N 天"）。真实归属以下表为准：

| 子目录 | 张数 | 实际内容 | 引用方 |
|--------|------|----------|--------|
| `Day1_images\` | 49 | **机器视觉实训全部 5 天**（09-07 ~ 09-11） | `机器视觉实训\学习记录\`、`实习日志\` |
| `Day2_images\` | 8 | 机器人实训 **09-13** | `机器人实训\` 各笔记 |
| `Day3_images\` | 14 | 机器人实训 **09-14** | 同上 |
| `Day4_images\` | 10 | 机器人实训 **09-15** | 同上 |
| `Day5_images\` | 4 | 机器人实训 **09-16** | 同上 |
| `知识库配图\` | 4 | VisionMaster 知识库专用（主界面/模板匹配原理/相似度/关联相机） | `机器视觉实训\VisionMaster知识库\` |

> 机器人实训 09-17（总结汇报日）无配图，故没有下一个 DayN。
> **单张图的日期以文件名前缀 `image-MMDD_` 为准**，比目录名可靠。
> Day1 里另有约 9 张无日期前缀的图（`image-<哈希>.png`、`image-script_variables.png` 等），是早期截图命名方式不同，属正常，不是错误。

## 二、未被任何笔记引用的 16 张"备用截图"（**勿当孤儿清理**）

以下 16 张是实操时多拍的备用图，经 md5 校验与已引用图片**不重复**。它们**当前没有引用是预期状态**：

```
Day1_images\image-0909_arc_defect.png            Day1_images\image-0909_script_error.png
Day1_images\image-0909_comm_flow.png             Day1_images\image-0909_weld_filter.png
Day1_images\image-0909_parts_flow.png            Day1_images\image-0910_group_help.png
Day1_images\image-0909_parts_var.png             Day1_images\image-0910_loop_flow.png
Day1_images\image-0909_plastic_caliper.png       Day1_images\image-0910_vertex_basic.png
Day1_images\image-0909_plastic_defectparam.png   Day1_images\image-0910_vertex_result.png
Day1_images\image-0910_vertex_run.png            Day1_images\image-script_variables.png
Day2_images\image-0913_rs_station_preview.png    Day4_images\image-0915_draw3circles_ppt.jpg
```

## 三、引用深度速查（写新笔记时用）

| 笔记所在位置 | 正确前缀 |
|--------------|----------|
| `机器视觉实训\学习记录\`、`实习日志\`、`VisionMaster知识库\`、`机器人实训\学习记录\`、`实习日志\` | `../../配图/DayN_images/xxx.png`（**2 层**） |
| `VisionMaster知识库\02_入门\` 等再下一级的子目录 | `../../../配图/…`（**3 层**） |

> **按笔记实际位置数层数**，别照抄别处。改完跑根目录 `tools_verifylinks.ps1`（或 `.py`）即可确认无裂图。
