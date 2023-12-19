-- 启动最后执行的地方
return function()
  require "user.config.global"
  require "user.config.plugin_mappings" -- 插件设置
  -- 自动打开上一次会话
  local path = vim.fn.expand "%:p"
  if path == "" then
    require("resession").load "Last Session"
  elseif vim.fn.isdirectory(path) == 1 then
    require("resession").load(path.sub(1, -2), { dir = "dirsession", silence_errors = true })
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
  -- vim.lsp.set_log_level(vim.log.levels.DEBUG)
end
