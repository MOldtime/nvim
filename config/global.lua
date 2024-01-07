if vim.g.neovide then require "user.config.ide.neovide" end -- ide 的检测, 并启动不同的设置

local VimScript_list = {
  "lan zh_CN.UTF-8", -- 设置语言为中文
}

for _, v in ipairs(VimScript_list) do
  vim.api.nvim_command(v)
end

-- 自动打开上一次会话
local path = vim.fn.expand "%:p"
if path == "" then
  require("resession").load "Last Session"
elseif vim.fn.isdirectory(path) == 1 then
  local name = string.sub(path, 1, -2)
  -- vim.notify(name)
  require("resession").load(name, { dir = "dirsession", silence_errors = true })
end
-- 光标居中
vim.cmd [[
augroup CenteredScrolling
  autocmd!
  autocmd WinScrolled * let &scrolloff = (winwidth(0) - &textwidth) / 16
  autocmd CursorMoved * let &scrolloff = (winwidth(0) - &textwidth) / 16
  autocmd BufWinEnter * lua vim.o.sidescrolloff =  math.floor(vim.fn.winwidth(0) / 5 + 0.5)
augroup END
]]
-- 设置
-- vim.lsp.set_log_level(vim.log.levels.INFO)
