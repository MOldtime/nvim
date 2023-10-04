**个人配置**

### 使用方式

1. 克隆[主仓库](https://github.com/AstroNvim/AstroNvim) 配置文件

```shell
git clone https://github.com/AstroNvim/AstroNvim.git
```

2. 克隆此目录到`./lua/user`下

```shell
git clone https://github.com/MOldtime/vim.git
```

3. 可选
    - 字体下载，建议安装  
        [Download](https://www.nerdfonts.com/font-downloads) 
        > 复制下面的描述搜索定位到字体，建议两个都安装
        1. JetBrainsMono Nerd Font
        ```
        JetBrains officially created font for developers
        ```
        2. Noto Nerd Font
        ```
        ``0` and `O` very similar, characters are either very curvy or straight lined` 
        ```
    - [lazygit](https://github.com/jesseduffield/lazygit)   
    > <leader>gg git请求
    Install:   
    ```Bash
    winget install -e --id=JesseDuffield.lazygit
    ```
    - [ripgrep](https://github.com/BurntSushi/ripgrep)  
    > <leader>fw 搜索文件  
    Install:
    ```Shell
    winget install BurntSushi.ripgrep.MSVC
    ```

### 配置文件


### 键盘备注

`正常来说，使用 <leader>加对应的键可以有提示，详情请查看对应的项目目录`

#### 文件树
| 功能介绍       | 快捷键     |
| -------------- | :--------: |
| 打开文件树     | `Ctrl + e` |
| 定位文件树     | `Ctrl + e` |
| 设置当前根目录 | `.`        |
| 新建文件       | `a`        |
| 新建文件夹     | `A`        |
| 从文件管理器打开| `O`		  |

----

#### lsp快捷键
|功能介绍                  |快捷键             |
| ------------------------ | :---------------: |
| 跳转到定义               |`gd`               |
| 跳转到声明               |`gD`               |
| 查看引用                 |`gr`&`<leader>gR`  |
| 跳转到上一个错误         |`[d`               |
| 跳转到下一个错误         |`]d`               |
| 悬停文档                 |`K`                |
| 重命名                   |`<leader>lr`       |
| 类型定义                 |`gy`               |
| 实现                     |`gI`               |
| 格式化代码               | `<leader>lf`      |
| 方法&字段                |`<leader>ls`       |
| 左侧显示``方法``&``字段` |`<leader>lS`       |
| 查看所有错误             |`<leader>lD`       |
| 打开错误详情             |`<leader>ld` & `gl`|

----

#### lazygit
|功能介绍                                |快捷键      |
| -------------------------------------- | :--------: |
| lazygit                                |`<leader>gg`|
| 添加 `add .`                           | a          |
| 添加到到一次 `commit`                  | A          |
| 提交 `commit`                          | c          |
| 拉取 `pull`                            | p          |
| 提交到远程仓库 `Push`                  | P          |
| 把当前分支的合并到目标分支之后 `Rebase`| r          |
