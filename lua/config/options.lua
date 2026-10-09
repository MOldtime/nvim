-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

for key, value in pairs({
  scrolloff = 4,
  sidescrolloff = 8,
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
  equalalways = false, -- 新增窗口是不要自动计算
}) do
  vim.opt[key] = value
end

for key, value in pairs({
  mapleader = " ", -- sets vim.g.mapleader
  autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
  cmp_enabled = true, -- enable completion at start
  autopairs_enabled = true, -- enable autopairs at start
  diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
  icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
  ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  resession_enabled = true, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  inlay_hints_enabled = true,
}) do
  vim.g[key] = value
end

require("config.ide.neovide")
