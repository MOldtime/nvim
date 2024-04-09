for _, value in ipairs {
  "lan zh_CN.UTF-8", -- 设置语言为中文
} do
  vim.api.nvim_command(value)
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

--[[
-- 光标
vim.cmd [[
" augroup CenteredScrolling
"   autocmd!
"   autocmd WinScrolled * let &scrolloff = (winwidth(0) - &textwidth) / 2
"   autocmd CursorMoved * let &scrolloff = (winwidth(0) - &textwidth) / 2
"   autocmd BufWinEnter * lua vim.o.sidescrolloff =  math.floor(vim.fn.winwidth(0) / 5 + 0.5)
" augroup END
" ]]
--]]
-- 设置
-- vim.lsp.set_log_level(vim.log.levels.INFO)
