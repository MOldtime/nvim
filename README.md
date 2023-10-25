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
    Install:   
    ```Bash
    winget install -e --id=JesseDuffield.lazygit
    ```
    - [ripgrep](https://github.com/BurntSushi/ripgrep)  
    Install:
    ```Shell
    winget install BurntSushi.ripgrep.MSVC
    ```

### 配置文件


### 键盘备注

`正常来说，使用 <leader>加对应的键可以有提示，详情请查看对应的项目目录`

#### Neo-Tree(文件树)
| 功能介绍        | 快捷键     |
| --------------- | :--------: |
| 打开文件树      | `Ctrl + e` |
| 定位文件树      | `Ctrl + e` |
| 设置当前根目录  | `.`        |
| 新建文件        | `a`        |
| 新建文件夹      | `A`        |
| 从文件管理器打开| `O`        |
| 复制文件路径    | `Y`        |
| 从缓冲区打开    | `l`        |

---

#### Lsp快捷键
| 功能介绍                 | 快捷键            |
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
| 格式化代码               |`<leader>lf`       |
| 方法&字段                |`<leader>ls`       |
| 左侧显示方法&字段        |`<leader>lS`       |
| 查看所有错误             |`<leader>lD`       |
| 打开错误详情             |`<leader>ld` & `gl`|
---

#### Lazygit
|功能介绍|   快捷键   |
| ------ | :--------: |
| lazygit|`<leader>gg`|
---

#### TreeSitter
|   功能介绍  |    快捷键     |
| ----------- | ------------- |
| 进入增量选择| `gnn`         |
| 扩大范围    | `Enter(回车)` |
| 缩小范围    | `退格`        |
| 选择作用域  | `grc`         |
---

#### Flash
|       功能介绍      |       快捷键       |
| ------------------- | :----------------: |
| 跳转                | `<leader><leader>` |
| 跳转到每个单词的前面| `<leader>zf`       |
---

#### Visual-Multi
|    功能介绍    |         快捷键         |
| -------------- | :--------------------: |
| 上下设置多光标 | `Ctrl + Shift + j & k` |
| 以最长的的对齐 | `\\a`                  |
---

#### Search-Replace
> 使用的是官方的`s`命令，下面的是`flags`的含义  

| key | value                                                |
| --- | ---------------------------------------------------- |
|  g  | global，表示在指定范围内执行全局操作,替换所有匹配项  |
|  c  | confirm，可以确认或拒绝修改                          |
|  n  | number，报告匹配到的次数，不替换，可用来查询匹配次数 |
|  i  | 执行不区分大小写的替换                               |
|  I  | 执行区分大小写的替换                                 |
|  e  | 防止替换失败时显示错误消息                           |

|           功能介绍                |     快捷键    |
| --------------------------------- | ------------- |
| 替换选中的内容                    | `Ctrl + r`    |
| 对选中的范围进行替换              | `Ctrl + s`    |
| 选中一个字符，修改一行            | `Ctrl + b`    |
| 显示列表                          | `<leader>rs`  |
| `%s/old/new/gcI`                  | `<leader>ro`  |
| `%s/{光标下的词}/new/gcI`         | `<leader>rw`  |
| `%s/{光标下的词，范围大}/new/gcI` | `<leader>rW`  |
| `%s/{光标下的词}/new/gcI`         | `<leader>re`  |
| `%s/{变量路径}/new/gcI`           | `<leader>rf`  |
| 显示列表                          | `<leader>rbs` |
---


#### Pastify(复制截图)
|功能介绍|    快捷键   |
| ------ | :---------: |
| 插入   | `<leader>zp`|
---
#### BitoAi
|              功能介绍                  |     快捷键    |
| -------------------------------------- | :-----------: |
| 提问                                   | `<leader>aq`  |
| 选中提问                               | `<leader>aq`  |
| 提问选中的内容                         | `<leader>aa`  |
| 对选中代码作解释                       | `<leader>ae`  |
| 对选中的代码整理，增强可读性和可维护性 | `<leader>ar`  |
| 检测选中代码的潜在问题                 | `<leader>cc`  |
| 检测选中的代码安全                     | `<leader>acs` |
| 检测选中的代码样式(风格)               | `<leader>acS` |
| 分析选中的代码性能                     | `<leader>acp` |
| 对选中的代码生成测试                   | `<leader>agu` |
| 对选中的代码生成注释，解释参数和输出   | `<leader>agc` |
---
#### 自定义
| 功能介绍 | 快捷键    |
| -------- | :-------: |
| 输入 `^` | `Alt + j` |
| 轮入 `%` | `ALt + f` |

#### Neovim
|小技巧        | 快捷键 |
| ------------ | :----: |
| 替换字符     |  `r`   |
| 往后替换字符 |  `R`   |
| 选中替换字符 |  `r`   |

### Map-Table
|    Mode    | Normal | Insert | Command-line | Visual | Select | Operator-pending | Terminal | Lang-Arg |  
|:----------:|:------:|:------:|:------------:|:------:|:------:|:----------------:|:--------:|:--------:|  
|    map     |   ✓    |   -    |      -       |   ✓    |    ✓   |        ✓         |    -     |    -     |
|    nmap    |   ✓    |   -    |      -       |   -    |    -   |        -         |    -     |    -     |
|    map!    |   -    |   ✓    |      ✓       |   -    |    -   |        -         |    -     |    -     |
|    imap    |   -    |   ✓    |      -       |   -    |    -   |        -         |    -     |    -     |
|    cmap    |   -    |   -    |      ✓       |   -    |    -   |        -         |    -     |    -     |
|    vmap    |   -    |   -    |      -       |   ✓    |    ✓   |        -         |    -     |    -     |
|    xmap    |   -    |   -    |      -       |   ✓    |    -   |        -         |    -     |    -     |
|    smap    |   -    |   -    |      -       |   -    |    ✓   |        -         |    -     |    -     |
|    omap    |   -    |   -    |      -       |   -    |    -   |        ✓         |    -     |    -     |
|    tmap    |   -    |   -    |      -       |   -    |    -   |        -         |    ✓     |    -     |
|    lmap    |   -    |   ✓    |      ✓       |   -    |    -   |        -         |    -     |    ✓     |
---
