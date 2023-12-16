-- 启动最后执行的地方
return function()
  require "user.config.global"
  require "user.config.plugin_mappings" -- 插件设置
  -- 有路径就加载当前的目录的窗口
  local path = vim.fn.expand "%:p"
  if path == "" then
    vim.api.nvim_command "SessionManager! load_last_session"
  -- elseif vim.fn.isdirectory(path) == 1 then
  --   vim.api.nvim_command "SessionManager! load_current_dir_session"
  -- else
    -- print("启动时指定的是文件: " .. path)
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
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities.offsetEncoding = { "utf-16" }
  -- require("lspconfig").clangd.setup { capabilities = capabilities }
  -- vim.lsp.set_log_level(vim.log.levels.DEBUG)
end
