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
end
