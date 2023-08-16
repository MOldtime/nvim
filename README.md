# AstroNvim User Configuration Example

A user configuration template for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

键盘指南：
文件树（资源管理器）：
|功能|快捷键
|---|---|
打开(关闭)资源管理器|`<leader>e`
光标移动到资源管理器|`<leader>o`
设置当前目录为主目录|`.`
显示隐藏目录|`H`
搜索文件|`f`
文件搜索后上下移动|`<Ctrl>j(k)`
模糊搜索|`/`
