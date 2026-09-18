# 机器人实训 · 资料索引

> ⚠️ **免责声明**：本仓库全部内容为基于个人学习记录**由 AI 自主整合**的版本，**未经人工优化**，仅供学习内容参考；如照搬全抄造成课程成绩损失，概不负责。

> 专业实习第二部分（ABB RobotStudio 6.08）配套资料整理。
> 整理日期：2026-09-13（2026-09-18 结构调整）
>
> 🔧 **软件安装、官方手册获取** → 见根目录 [`../资源说明.md`](../资源说明.md)。
> 🤖 **（给 AI 助手）** 需要协作约定与本机环境细节的，读根目录 [`../AGENTS.md`](../AGENTS.md)。

## 本工作区目录总览

```
机器人实训\
├── README.md                ← 本文件（资料索引 + 手册速查）
├── 学习记录\                ← ✅ 按天实操笔记（0913 起，含 0914 真机夹爪抓取、0915 RAPID 编程与 IF 练习）
├── 实习日志\                ← ✅ 实习日记 Day_0913~0917 + 撰写要求
├── 工作站归档\              ← 站点快照(.rsstn) + RAPID 源码(.mod) 阶段性归档
└── RAPID代码\               ← agent 产出的 .mod 模块（可直接加载）
```

> **记录体例**（与根目录 `机器视觉实训\` 一致）：学习记录 `YYYY-MM-DD_主题.md`，当日汇总 `YYYY-MM-DD_当日汇总.md`，实习日记 `Day_MMDD_主题.md`；
> 日记体例须含 **时间/地点/方式/内容/问题/收获**，详见 `实习日志\README_撰写要求.md`。
> 配图统一放在根目录 `..\配图\DayN_images\`（相对本目录为 `../配图/`）。

## 一、三个原始路径的定位

| 路径 | 是什么 | 说明 |
| --- | --- | --- |
| `机器人实训\` | **工作区**（笔记与日志） | 本目录（本仓库的一部分） |
| `<RobotStudio安装目录>` | **软件安装目录** | RobotStudio 6.08 程序本体，帮助文档/模型库/示例都在这里（在工作区之外，须用绝对路径） |
| `<RobotStudio安装包目录>` | **安装包（解压后）** | 含 `setup.exe`、`ABB RobotStudio 6.08.msi`、`Data1.cab` 等；另有官方 Release Notes PDF |

## 二、关键发现：官方帮助文档

安装目录里带着**完整的 ABB 官方手册（CHM 格式）**，中文 9 本 + 英文 12 本：

- 原始位置：`<RobotStudio安装目录>\Help\zh-CN\` 和 `<RobotStudio安装目录>\Help\en\`
- CHM 直接用 Windows 帮助查看器打开即可（双击，或 `hh.exe <文件>`）。

> ⚠️ **手册不在本分享包里**（体积大 + 属 ABB 版权），**装好 RobotStudio 就有**（获取方法见根目录 [`../资源说明.md`](../资源说明.md) 第二节）。
> 下面三~五节是**手册清单**：说明有哪些手册、各管什么；查内容请翻你本机安装目录里的那份。

## 三、中文手册（ABB 官方，随 RobotStudio 安装）

| 目录 | 手册名 | 原文件 | 页数 |
| --- | --- | --- | --- |
| `01_RobotStudio操作员手册` | RobotStudio 操作员手册 | RobotStudio.chm | 304 |
| `02_RAPID指令函数数据类型` | RAPID 指令、函数和数据类型（技术参考手册） | RAPID.chm | 695 |
| `03_IntegratedVision应用手册` | Integrated Vision 应用手册（视觉） | 3HAC044251 | 53 |
| `04_控制器软件IRC5应用手册` | 控制器软件 IRC5 应用手册 | 3HAC050798 | 273 |
| `05_带FlexPendant的IRC5操作员手册` | 带 FlexPendant 的 IRC5 操作员手册 | 3HAC050941 | 157 |
| `06_RAPID语言内核技术参考手册` | RAPID 语言内核 技术参考手册 | 3HAC050946 | 89 |
| `07_RAPID语言概览技术参考手册` | RAPID 语言概览 技术参考手册 | 3HAC050947 | 54 |
| `08_系统参数技术参考手册` | 系统参数 技术参考手册 | 3HAC050948 | 826 |
| `09_MultiMove应用手册` | MultiMove 应用手册（多机器人协调） | 3HAC050961 | 58 |

**怎么读**：每本目录下 `start.html` 是封面/入口，`toc.hhc` 是完整目录（已转成 UTF-8，可用浏览器打开，点击跳转），`docN.html` 是正文页。

## 四、英文手册（ABB 官方，中文版没有的部分）

| 目录 | 内容 |
| --- | --- |
| `10_SafeMove应用手册` | SafeMove 安全监控功能 |
| `11_功能安全应用手册` | Functional safety 功能安全 |
| `12_PROFINET应用手册` | PROFINET 现场总线 |
| `13_传送带跟踪应用手册` | Conveyor tracking 传送带跟踪 |
| `14_RobotWare_Spot应用手册` | 点焊（Spot） |
| `15_RobotWare_Arc应用手册` | 弧焊（Arc），含焊缝跟踪 |
| `16_CAP应用手册` | 连续应用平台（CAP） |
| `17_RobotWare_Dispense应用手册` | 涂胶/点胶（Dispense） |
| `18_电子位置开关应用手册` | Electronic Position Switches |
| `19_附加轴与非ABB机器人应用手册` | 附加轴、伺服焊枪、非 ABB 机器人 |
| `20_迁移指南_5.6x到6.x` | 旧版本配置迁移（含 MMC） |
| `21_RobotStudio_API参考_NET_SDK` | **RobotStudio .NET API 参考**（6396 页，写自定义 Add-in / SDK 开发用） |

## 五、官方参考文档 PDF

- `Release Notes RobotStudio 6.08.pdf` — 本版新功能与已知问题
- `Release Notes RW 6.08.pdf` — RobotWare 6.08 发行说明
- `许可协议EULA.rtf`、`Privacy.rtf`

## 六、可直接复用的素材（随 RobotStudio 安装）

| 目录 | 来源 | 用途 |
| --- | --- | --- |
| `代码片段_CodeSnippets` | 安装目录 Code Snippets | RAPID 代码片段：模块头、robtarget/tooldata/wobjdata、数组、错误处理；弧焊/点焊/视觉片段 |
| `指令模板_InstructionTemplates` | Instruction Templates | 工艺指令模板 XML（Arc / Spot / Conveyor / MultiMove / Paint / Trigg 等） |
| `教学模型_TrainingObjects` | ABB Library\Training Objects | **教学用模型**：`myTool.rslib`、`propeller.rslib`、`Curve_Thing`、`Table`、`Pen` 等（即本实训用到的那些） |
| `示例工作站_Stations` | Samples\Stations | 4 个官方示例工作站：`Demo AW Station`（弧焊）、`Demo Exhaust Pipe`、`Demo FlexLoader`、`Demo Solar Simulation` |
| `RAPID文件模板_zh-CN` | FileTemplates\zh-CN | `MainModule.mod`、`EmptyModule.mod`、`SystemModule.sys` |

> 本站用到的组件正是 `IRB1200_5_90_STD_02`、`myTool`、`Curve_Thing`、`table_and_fixture_140` 等，都能在 `<RobotStudio安装目录>\ABB Library\` 里找到（RobotStudio 的「导入模型库」直接取用，无需手动找路径）。

## 七、速查：什么问题查哪本

| 你要做的事 | 看哪本 |
| --- | --- |
| 熟悉界面、建站、装机器人/工具/工件坐标 | `01_RobotStudio操作员手册`（第 38~66 节「构建工作站/机器人编程」） |
| 查某条 RAPID 指令的语法与参数 | `02_RAPID指令函数数据类型` |
| 学 RAPID 语言结构、变量、程序流程 | `07_RAPID语言概览` + `06_RAPID语言内核` |
| 配 I/O、系统参数、通信 | `08_系统参数技术参考手册` |
| 两台机器人协同 | `09_MultiMove应用手册` |
| 视觉引导抓取 | `03_IntegratedVision应用手册` |
| 示教器（FlexPendant）操作 | `05_带FlexPendant的IRC5操作员手册` |
| 写插件 / 二次开发 | `21_RobotStudio_API参考_NET_SDK` |

> 上表手册均为 ABB 官方随软件安装的内容，位置见 `../资源说明.md` 第二节。

## 八、模型库位置（本项目用到）

`<RobotStudio安装目录>\ABB Library\` 下的分类：`Robots`(350)、`Positioners`(144)、`Tracks`(612)、`Tools`(41)、`Equipment`(41)、`Components`(73)、`Training Objects`(20)。RobotStudio 的「ABB 模型库 / 导入模型库」默认从这里取。

## 九、学习记录与日志

| 日期 | 学习记录（`学习记录\`） | 实习日记（`实习日志\`） |
| --- | --- | --- |
| 2026-09-13 | [环境与建站](学习记录/2026-09-13_RobotStudio环境与建站.md)、[RAPID首个程序MoveJ](学习记录/2026-09-13_RAPID首个程序MoveJ.md)、[奇异点规避](学习记录/2026-09-13_奇异点规避.md)、[轮廓巡点与坐标系一致](学习记录/2026-09-13_轮廓巡点与坐标系一致.md) | [Day_0913_RobotStudio入门到轮廓巡点](实习日志/Day_0913_RobotStudio入门到轮廓巡点.md) |
| 2026-09-14 | [夹爪抓取与松开（Set/Reset/WaitTime）](学习记录/2026-09-14_夹爪抓取与松开.md)、[工具与工件坐标系新建](学习记录/2026-09-14_工具与工件坐标系新建.md)、[斜向平面工件坐标系](学习记录/2026-09-14_斜向平面工件坐标系.md)、[Offs偏移函数](学习记录/2026-09-14_Offs偏移函数.md)、[真机Offs矩形轨迹](学习记录/2026-09-14_真机Offs矩形轨迹.md)、[软件轮廓遍历Offs](学习记录/2026-09-14_软件轮廓遍历Offs.md) | [Day_0914_抓取到Offs轮廓遍历](实习日志/Day_0914_抓取到Offs轮廓遍历.md) |
| 2026-09-15 | [RAPID编程起步与同步机制](学习记录/2026-09-15_RAPID编程起步与同步机制.md)、[人机交互指令练习（交换两数）](学习记录/2026-09-15_人机交互指令练习.md)、[IF语句求最小值](学习记录/2026-09-15_IF语句求最小值.md)、[IF时间段判断](学习记录/2026-09-15_IF时间段判断.md)、[IF借阅费计算](学习记录/2026-09-15_IF借阅费计算.md)、[FOR循环整除13](学习记录/2026-09-15_FOR循环整除13.md)、[FOR循环画三个圆](学习记录/2026-09-15_FOR循环画三个圆.md)、[画圆拓展与编程易错点](学习记录/2026-09-15_画圆拓展与编程易错点.md) | [Day_0915_RAPID编程入门到循环画圆](实习日志/Day_0915_RAPID编程入门到循环画圆.md) |
| 2026-09-16 | [数组练习最值差](学习记录/2026-09-16_数组练习最值差.md)、[嵌套循环六个圆](学习记录/2026-09-16_嵌套循环六个圆.md)、[WHILE用户登录](学习记录/2026-09-16_WHILE用户登录.md)、[综合练习计算器](学习记录/2026-09-16_综合练习计算器.md) | [Day_0916_数组嵌套循环与WHILE综合练习](实习日志/Day_0916_数组嵌套循环与WHILE综合练习.md) |
| 2026-09-17 | （无新增学习记录，当天为总结汇报） | [Day_0917_总结汇报与学生代表发言](实习日志/Day_0917_总结汇报与学生代表发言.md) |

> 工作站源文件：`%USERPROFILE%\Documents\RobotStudio\Solutions\260913Study1`；工作站快照（含 `Path_10`/`Path_20` 轮廓路径）与 RAPID 源码归档在 `工作站归档\`。0914 含**真机实操**（示教器 `dh260914study1`，程序 `dh0914r1`/`dh0914r2`），证据为截图。

## 十、⚠️ 待办事项

### 实机"三盒搬运"（FOR 循环抓放）——**至实习结束仍未实操**

**背景**：机械臂两侧（Y 方向）各有一台子，一侧沿 X 放**三个盒子**，用 FOR 循环**逐个搬到另一侧**。
**状态**：❌ **未实操**（0915 机器故障顺延 → 0916、0917 均未补上）。代码框架已写好，未上机验证。

| 项 | 状态 |
|----|------|
| 框架代码 | ✅ `RAPID代码\PickPlace_取放框架_0915.mod`（8 步阶梯：接近→下降→夹紧→抬起→平移→下降→松开→抬起） |
| `dx := 183`（盒子间距） | ✅ 已填（实机量的） |
| `hi`（安全抬升高度） | ⬜ 上机估一个 |
| `pPick` / `pPlace` | ⬜ 上机**示教** |
| 夹爪信号名 | ⬜ 核实（0914 记的是 `D10_Gripper_Close` / `D11_Gripper_Open`，可能是 `DI0/DI1`） |
| 重选 `main` 指向 | ⬜ `pick_place;` |

**★ 上机前必须知道的结论**（已查手册，避免重走弯路）：
1. **`VAR` 写在 PROC 里，示教值会丢** —— 手册初始化表：**"移动 PP 到 main / Routine" 时 `VAR` 会重新初始化**。
2. **`PERS` 示教值能存住**（"未变"），但**只能在模块级声明**（手册原文："只能在模块级进行永久数据对象声明，在程序内不能"）。
   → **建议：两个待示教的点（`pPick`/`pPlace`）用 `PERS` 放模块级，其余（`dx`/`hi`/`i`）留在 PROC 里。**
3. **示教完要"保存模块"**，把 PERS 当前值写回代码（手册："保存模块的同时会更新初始值"）。
4. **带参数的例程不能设 PP**（`C004900F`）——所以本任务用**无参** `pick_place()`，可直接设 PP。
5. **调试顺序**：先示教 → **把 `FOR i FROM 0 TO 2` 临时改成 `0 TO 0` 只搬一个** → 单步跑通 → 再放开循环。

## 十一、备注

- 只想读原版 CHM：直接双击 `<RobotStudio安装目录>\Help\zh-CN\`（或 `\en\`）下的 `.chm` 即可；反编译成 HTML 的方法见根目录 `../资源说明.md` 第二节。
