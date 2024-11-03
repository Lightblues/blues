# VS Code

- GitHub 登陆同步
- Remote Explorer 超好用；自动读取 `/etc/hosts` 配置

## Command Palette 命令面板

`CMD/CTRL + SHIFT + P` 唤出

```bash
Open Settings (JSON)  # 打开用户配置文件
Reload Window         # 重新加载窗口
```

## 实用插件

!!! warning
    注意, 对于不是通用的插件, 选择工作区打开而非全局开启, 提升性能.

- Bracket Pair Colorizer 2 高亮区分匹配的括号，方便查看代码块
- Bookmark 代码标记
- Rest Client API 开发
- Thunder Client API开发，参见 <https://www.boredapi.com/>
- Prettier 开启 format on save 功能
- Auto Close Tag 自动关闭标签
- Auto Rename Tag 自动更新标签名称
- Emmet HTML 简写（Code自带了）

git

- GitLens
- gitignore 预定义的一些 gitignore 配置

中文 <-> 转义后的ASCII (例如json)

- `cwan.native-ascii-converter` Native-ASCII Converter
    - Convert characters with Unicode escapes or vice versa. The same as 'native2ascii' tool of JDK.

### Markdown

[doc](https://code.visualstudio.com/docs/languages/markdown)

参见 [在VSCode中高效编辑markdown的正确方式](https://www.thisfaner.com/p/edit-markdown-efficiently-in-vscode/)。

- 原生支持的
    - 自带预览功能。通过快捷键 `Ctrl+Shift+V`。
    - 大纲视图：大纲视图是文件资源管理器底部的单独部分
    - 为 markdown 提供 snippets

插件

- `docs-markdown` 插件
    - 导入外部文件（直接嵌入Markdown渲染！）
- `markdown-formatter` 这里的配置项写得很清楚 <https://github.com/sumnow/markdown-formatter/blob/HEAD/README_CN.md>

#### Markdown All in One

- 增强的列表编辑功能
- 直接在选定文本上使用 `Ctrl+v` 来插入链接

自动补全：在 `settings.json` 文件中添加

```json
  "[markdown]": {
  // 快速补全
  "editor.quickSuggestions": {
  "other": true,
  "comments": true,
  "strings": true
  },
  // 显示空格
  "editor.renderWhitespace": "all",
  // snippet 提示优先（看个人喜欢）
  "editor.snippetSuggestions": "top",
  "editor.tabCompletion": "on",
  // 使用enter 接受提示
  // "editor.acceptSuggestionOnEnter": "on",
  },
```

- 输入 `code` 就会弹出行内代码和代码块两种补全提示
- 输入 `ul` 或 `li` 就会弹出列表补全提示
- 类似的还有 `bold` 、`image`、`italic`、`link` 、`quote` 等。

提供了一些快捷方式

`Ctrl/Cmd + B` Toggle bold
`Ctrl/Cmd + I` Toggle italic
`Ctrl/Cmd + Shift + ]` Toggle heading (uplevel)
`Ctrl/Cmd + Shift + [` Toggle heading (downlevel)
`Ctrl/Cmd + M` Toggle math environment
`Alt + C` Check/Uncheck task list item
`cmd+]` 缩紧

#### Markdown Preview Enhanced(MPE)

- `Markdown Preview Enhanced(MPE)` 插件
    - 扩展语法的支持，例如 `==` 高亮
    - 图片助手
    - 图片渲染
        - Mermaid

还可以自定义主题？选择 `none.css` 用原生的就很好！

#### makrdownlint

- `markdownlint` Markdown 语法检查扩展工具
    - 规则列表 <https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md>
    - repo <https://github.com/DavidAnson/vscode-markdownlint>
    - Makrdown  style <https://cirosantilli.com/markdown-style-guide/>

#### Markdown Notes

Use `[[wiki-links]]`, `backlinks`, `#tags` and `@bibtex-citations` for fast-navigation of markdown notes.

很赞!!

### SFTP

Liximomo 版本的插件说明 <https://github.com/liximomo/vscode-sftp#multiple-context> ；

多个服务器同步：目前用 `multi-context` ，这里 context 指的是（见wiki） string - A path relative to the workspace root folder. Using this when you want to map a subfolder to the remotePath.

例如，以下配置中，分别将 build 和 src 两个文件夹部署到了两台服务器上。

```json
[
  {
  "name": "server1",
  "context": "project/build",
  "host": "host",
  "username": "username",
  "password": "password",
  "remotePath": "/remote/project/build"
  },
  {
  "name": "server2",
  "context": "project/src",
  "host": "host",
  "username": "username",
  "password": "password",
  "remotePath": "/remote/project/src"
  }
]
```

## 编程语言插件配置

### Python

- `donjayamanne.python-extension-pack` Python Extension Pack
    - `ms-python.python` IntelliSense (Pylance), Linting, Debugging (multi-threaded, remote),
    - `donjayamanne.python-environment-manager` Python Environment Manager
        - View and manage Python environments & pacakges.
    - `KevinRose.vsc-python-indent` Python Indent 缩进
        - Correct python indentation.
    - `njpwerner.autodocstring` autoDocstring - Python Docstring Generator
        - Generates python docstrings automatically 有助于写比较规范的文档

文档

- debugging <https://code.visualstudio.com/docs/python/debugging>
- testing <https://code.visualstudio.com/docs/python/testing>
- torch <https://code.visualstudio.com/docs/datascience/pytorch-support>

### C/C++

- 简化：<https://zhuanlan.zhihu.com/p/96819625>
- base <https://code.visualstudio.com/docs/languages/cpp>
    - After you install the extension, when you open or create a `*.cpp` file, you will have syntax highlighting (colorization), smart completions and hovers (IntelliSense), and error checking.
- 配置
    - 例如 macOS 下的 <https://code.visualstudio.com/docs/cpp/config-clang-mac>
    - Build: `tasks.json` file; add config with `Terminal > Configure Default Build Task`;
        - build with `Terminal > Run Build Task`, or `Shift+cmd+B`
    - Debug: `launch.json` file; add config with `Run > Add Configuration...` and choose `C++ (GDB/LLDB)`;
        - start debug with `Run > Start Debugging` or simply press `F5`
    - C/C++ configuration: create `c_cpp_properties.json` file with command `C/C++: Edit Configurations (UI)` in Command Pallete
        - 注意到设置这里的 C++ 标准给 Code 扩展，影响语法高亮和标错等行为

插件

- 插件包 `ms-vscode.cpptools-extension-pack`
    - ms-vscode.cpptools: C/C++ IntelliSense, debugging, and code browsing.
    - ms-vscode.cpptools-themes: UI Themes for C/C++ extension.
    - twxs.cmake: CMake langage support for Visual Studio Code
    - ms-vscode.cmake-tools: Extended CMake support in Visual Studio Code
    - The bleeding edge of the C++ syntax: Let me generate Doxygen documentation from your source code for you.
    - jeff-hykin.better-cpp-syntax: The bleeding edge of the C++ syntax
- `mitaki28.vscode-clang` C/C++ Clang Command Adapter
    - Completion and Diagnostic for C/C++/Objective-C using Clang Command

```json
{
  // See https://go.microsoft.com/fwlink/?LinkId=733558
  // for the documentation about the tasks.json format
  "version": "2.0.0",
  "tasks": [
    {
      "type": "shell",
      "label": "clang++ build active file",
      "command": "/usr/bin/clang++",
      "args": [
        "-std=c++17",
        "-stdlib=libc++",
        "-g",
        "${file}",
        "-o",
        "${fileDirname}/${fileBasenameNoExtension}"
      ],
      "options": {
        "cwd": "${workspaceFolder}"
      },
      "problemMatcher": ["$gcc"],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

### Java

- `vscjava.vscode-java-pack` 拓展包
    - redhat.java Language Support for Java(TM) by Red Hat
        - Java Linting, Intellisense, formatting, refactoring, Maven/Gradle support and more...
    - vscjava.vscode-java-debug A lightweight Java debugger for Visual Studio Code

### R

R语言的支持似乎没有 Rstudio 的体验。

- `R` Extension for Visual Studio Code <https://github.com/REditorSupport/vscode-R> base
    - `radian`: A modern R console that corrects many limitations of the official R terminal and supports many features such as syntax highlighting and auto-completion.
    - `VSCode-R-Debugger`: A VS Code extension to support R debugging capabilities.
    - `httpgd`: An R package to provide a graphics device that asynchronously serves SVG graphics via HTTP and WebSockets.
    - installation: <https://github.com/REditorSupport/vscode-R/wiki/Installation:-macOS>
    - R Markdown: <https://github.com/REditorSupport/vscode-R/wiki/R-Markdown>
- `TianyiShi.rmarkdown` R Markdown All in One
    - R Markdown, Bookdown and Blogdown Support

### go

- 中文教程，讲得很系统 <https://learnku.com/courses/go-video/2022>
- base <https://code.visualstudio.com/docs/languages/go>
- debugging <https://github.com/golang/vscode-go/blob/master/docs/debugging.md>

- install go: <https://golang.org/dl/>
- 插件
    - `Go`: Rich Go language support for Visual Studio Code
- go语言基础 [Go语言学习之路/Go语言教程](https://www.liwenzhou.com/posts/Go/golang-menu/)

以下 from [learnku](https://learnku.com/courses/go-video/2022/vscode-go-plug-in-details/11314)

- 悬停信息
- 代码补全
- 包自动引入
- 参数辅助
    - 书写函数，在传参括号里输入 `,`  即可查看参数信息
- 代码跳转
    - 按住 Command 鼠标点击函数名称
    - 按住 Control 加 - 号（减号）
- 查找调用
    - 光标放置于函数上，右键 `Go to References`
    - 光标放置于函数上，右键 `Show call Hierarchy`
- 自动格式化（默认，无需配置）
- 提取变量（选中一个表示式之后，前面自动出现一个小黄灯）
- 代码生成
    - 生成 tag
    - 生成 struct
    - 生成单元测试
    - 生成接口的实现代码
- 重构函数名和变量
- 代码调试 —— Debuging

### SQL

- SQL Tools
    - `mtxr.sqltools` 插件本体
    - mtxr.sqltools-driver-mysql 搭配的 mysql 驱动

配置如下:

```json
// settings.json
    "sqltools.connections": [
        {
            "mysqlOptions": {
                "authProtocol": "default"
            },
            "previewLimit": 50,
            "server": "10.88.3.55",
            "port": 3306,
            "driver": "MySQL",
            "name": "BOC",
            "database": "bocom",
            "username": "boc",
            "password": "boc"
        },
    ]
```

运行: 选中查询语句, 然后两次 `Cmd+E` 执行.

### Latex

## VSCode-LaTeX-Workshop

参见: Latex 项目中的配置文件.

- 简单配置方案：[MacOS10.15.3+MacTex (TexLive2019)+VS Code的LaTex教程](https://zhuanlan.zhihu.com/p/107393437)
    - 更详细的参数参见 [Visual Studio Code (vscode)配置LaTeX](https://zhuanlan.zhihu.com/p/166523064)
- 若要配置外部PDF浏览器（Skim），参见 [macOS 配置 LaTeX（MacTeX + VSCode + Skim）](https://www.jianshu.com/p/4aee83e66ab8)
- Latex 资源
    - ElegantLatex [https://elegantlatex.org/cn/](https://elegantlatex.org/cn/) 提供了三套模版
- 蔡老板的作业模版 [https://github.com/YZ-Cai/latex-homework-template](https://github.com/YZ-Cai/latex-homework-template)

注意一定要添加 Latex 路径 `export PATH=/Library/Tex/texbin:$PATH`

```sh
export PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
export PATH=/usr/local/texlive/2021/texmf-dist/scripts/latexindent:$PATH
export MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH
```

快捷键

```js
编译快捷键：Command+Option+B
显示快捷键：Command+Option+V
正向搜索：选中代码Command+Option+J
反向搜索：shift+command点击预览PDF
```

---

使用 VS Code 远程编译

- 参见 [使用 VSCode 编写 LaTeX](https://codeswift.top/posts/vscode-latex/) ⭐️
- [东南大学研究生 Latex 模版](https://github.com/TouchFishPioneer/SEU-master-thesis)
    - 其中用到的字体 [CodeSwift-Comment](https://github.com/NiallLDY/CodeSwift-Comment)

远程安装 TexLive

```sh
# 安装 TexLive
sudo apt update
sudo apt upgrade
sudo apt install texlive-full
```

VS Code 远程连接，安装 LaTeX Workshop 拓展

进行配置，注意 Preferences: Open Workspace Settings (JSON) （Ctrl + Shift + P 命令面板）等选项中，工作区设置、远程设置、本地设置 这些区别。注意配置更新之后 Reload Window 重新加载窗口。

另外，字体问题，从 [这里](https://github.com/NiallLDY/CodeSwift-Comment) 下载放置好之后，以下刷新字体缓存

```sh
# 查看字体
fc-list :lang=zh

# 在 /usr/share/fonts/myfonts 中下载字体，更新字体缓存
mkfontscale
# 如果提示 mkfontscale: command not found
# sudo apt install ttf-mscorefonts-installer
mkfontdir
fc-cache -fv
# 如果提示 fc-cache: command not found
# sudo apt install fontconfig
```

Latex 有很多编译工具，常见的主要有 LaTeXmk、pdfLaTeX、XeLaTeX、LuaLaTeX 等，因为我们需要输出包含中文的 PDF，因此我们使用 XeLaTeX 工具。

## 快捷键

- doc [Key Bindings for Visual Studio Code](https://code.visualstudio.com/docs/getstarted/keybindings)
- 官方的快捷键清单 <https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf>，
- 另见命令行 `help: Interactive editor playground`；

基本

- `cmd+\` 拆分编辑器
- `cmd+K cmd+S` 键盘快捷方式
- `cmd+O` 打开文件；`cmd+R` 打开最近项目
- `cmd+J` 切换视图，隐藏 terminal 栏
- `cmd+B` 视图：侧边栏；但是在 Markdown 环境下 `markdown.extension.editing.toggleBold` 冲突

### 导航

- `opt` 配合左右是词级别；`cmd` 句子级别
- `cmd` 上下 移动到文档头尾
- `opt` 配合上下，移动整行
- `shift` 修饰，进行选择
- `cmd+]` 控制整行的缩进

#### Multi-cursor editing

- `opt+cmd+` 上下 进行进行多 cursor；`opt` 配合鼠标添加一个 cursor

#### Line actions

- `shift+opt+` 上下 复制整行
- `shift+cmd+K` 删除整行
- `opt` 配合上下，移动整行

#### Rename refactoring

- `F2` 或者右键选择

#### Formatting

- `shift+opt+F` 格式化整个文档
- `cmd+k cmd+F` 格式化当前行

可以配置 `editor.formatOnSave` 自动

#### Code folding

- `opt+cmd+[/]` 收缩展开 fold/unfold. 添加了新的快捷键 `opt+q/w`
- `cmd+K cmd+0` `cmd+K cmd+]` 完全收缩/展开

#### Errors and warnings

- `F8` 定位到错误处

### 自定义的

- `ctrl+Space` 代码补全和 macOS 的输入法切换撞了；暂无
- `shift+opt+~` 有时候不太行，换成了 `cmd+T`

## 配置

### Icon 文件图标主题

- `PKief.material-icon-theme` Material Icon Theme

## Debug

### Copilot: 在 Markdown 环境下无法 tab 补全

主要是快捷键问题. 参见 [here](https://github.com/microsoft/vscode/issues/130674)

Copilot 的补全属于 `editor.action.inlineSuggest.commit`. 设置为 `Tab` 即可补全.

查下来的问题好像是和 `markdown.extension.onTabKey` 发生了冲突, 不过后来重新设置一下又可以了?


### 性能: 内存占用

主要的解决方案, 还是少开一些window.

### 性能问题 (高CPU)

参见 <https://github.com/microsoft/vscode/wiki/Performance-Issues>

相关工具

```sh
# 查看进程占用 (帮助 - 进程管理器)
Developer: open process explorer
# or 在终端运行 code --status

# 查看插件占用
Developer: Show Running Extensions
# 命令行 code --disable-extensions

# 启动速度
Startup Performance.
# 命令行 code --prof-startup
```

介绍了常见的问题

- The Renderer/Window process consumes a lot of CPU
- The Shared process consumes a lot of CPU

### 无法监测大文件夹 "Visual Studio Code is unable to watch for file changes in this large workspace" (error ENOSPC)

参见 [这里](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc) ，到设置中添加 `files.watcherExclude` 项即可。很贴心的是，Code 的配置包括了 User, Remote, Workspace 不同的作用域。

```bash
**/venv/**
```

### VS Code调试Python时的执行路径

通过 `print(os.getcwd())` 打印当前路径

解决方案

 配置 launch.json

```json
"cwd": "${fileDirname}"
```

- os.chdir设置当前工作目录

```python
import os, sys
# 设置当前工作目录，放在import其他路径模块之前
os.chdir(sys.path[0])
 
# 导入上上级目录
sys.path.append("../../")
# 引入上上级目录下的模块
from submodulea.modulea import *
```

- sys.path.append添加顶层文件夹相对路径

```python
import os,sys
# 注意默认工作目录在顶层文件夹，这里是相对于顶层文件夹的目录
sys.path.append("./")
 
# 导入上上级目录
sys.path.append("../../")
```

## windows 环境说明

- `git`: 根据vscode的提示下载, 若安装之后提示招不到, 可以在设置中配置 `git.path` 参数.
- 中文设置采用英文标点: 在 `设置-语言-微软拼音-常规设置` 中点开 `中文输入时使用英文标点`.
    - 好吧, 实际上在底部的输入中也可以设置, 快捷键 `Ctrl+。`.
