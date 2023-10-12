-- 启动最后执行的地方
return function()
  require "user.config.global"
  require "user.config.plugin_mappings" -- 插件设置
  --[[
  -- 有路径就加载当前的目录的窗口
  local path = vim.fn.expand "%:p"
  if path == "" then
    vim.api.nvim_command "SessionManager! load_last_session"
  elseif vim.fn.isdirectory(path) == 1 then
    vim.api.nvim_command "SessionManager! load_current_dir_session"
  else
    print("启动时指定的是文件: " .. path)
  end
  ]]
  -- 光标居中
  vim.cmd [[
  augroup CenteredScrolling
    autocmd!
    autocmd WinScrolled * let &scrolloff = (winwidth(0) - &textwidth) / 2
    autocmd CursorMoved * let &scrolloff = (winwidth(0) - &textwidth) / 2
  augroup END
  ]]

  -- 在普通模式下动态调整 sidescrolloff
  -- autocmd VimResized * lua if vim.o.wrap then vim.o.sidescrolloff = (vim.fn.winwidth(0) - vim.fn.winwidth(0, true)) / 2 end
  -- autocmd VimEnter,WinEnter,BufWinEnter * lua if vim.o.wrap then vim.o.sidescrolloff = (vim.fn.winwidth(0) - vim.fn.winwidth(0, true)) / 2 end
  -- autocmd VimEnter,WinEnter,BufWinEnter * lua print(vim.fn.winwidth(0) / 2)
--   vim.api.nvim_exec(
--     [[
--   augroup AutoCenterSidescroll
--     autocmd!
--     autocmd BufWinEnter * lua vim.o.sidescrolloff =  math.floor(vim.fn.winwidth(0) / 2 + 0.5)
--   augroup END
-- ]],
--     false
--   )
  -- autocmd WinEnter * lua print('WinEnter')
  -- autocmd VimEnter * lua print('VimEnter')
  -- autocmd VimResized * lua print("VimResized")
end
