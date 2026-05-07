# L4D2-AstMod-Scriptings

求生之路 2 (Left 4 Dead 2) AstMod 插件所有源码及部分未完成插件。

## 简介
本项目包含了 AstMod 相关的 SourceMod 插件脚本（.sp）。你可以在这里找到核心逻辑实现、功能模块以及一些正在开发中的实验性功能。

## 编译指南

### 环境要求
为了确保插件能够正常运行并避免潜在的兼容性问题，**必须**使用以下特定版本的编译器进行编译：

* **SourceMod 编译器版本**: `1.11.0.6970`
* **语言**: SourcePawn 1.10+

### 编译步骤
1.  下载并解压 [SourceMod 1.11.0.6970](https://www.sourcemod.net/downloads.php?branch=1.11-dev) 。
2.  将本项目中的所有文件放入 SourceMod 的 `addons/sourcemod/scripting` 目录下。
3.  在 `addons/sourcemod/scripting` 目录下运行 `./compile.sh` 编译。
4.  成品！
