-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
require("config.ide.neovide")
vim.api.nvim_command("lan zh_CN.UTF-8")
for key, value in pairs({
	relativenumber = true, -- sets vim.opt.relativenumber
	number = false, -- sets vim.opt.number
	spell = false, -- sets vim.opt.spell
	signcolumn = "yes", -- sets vim.opt.signcolumn to yes
	wrap = false, -- sets vim.opt.wrap
	clipboard = "",
	expandtab = false, -- tab space
	list = true,
	termguicolors = true, -- 开启真彩色
	listchars = {
		tab = "---",
	},
	inccommand = "split", -- 在实时预览窗口中显示搜索/替换的效果
	cmdheight = 1,
	smartindent = true,
	guicursor = "n-v-c-sm:block,r-cr-o:hor20,i-ci-ve:ver20-blinkwait250-blinkoff700-blinkon700",
	jumpoptions = "stack", -- 改变 ctrl + o 跳转的方式
}) do
	vim.opt[key] = value
end

for key, value in pairs({
	autoformat = false,
}) do
	vim.g[key] = value
end
-- vim.lsp.set_log_level("DEBUG")
