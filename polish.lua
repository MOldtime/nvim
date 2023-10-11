-- 启动最后执行的地方
return function()
  require "user.config.global"
  require "user.config.plugin_mappings" -- 插件设置
  -- 有路径就加载当前的目录的窗口
  -- local wins = vim.api.nvim_tabpage_list_wins(0)
  -- if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
  --   vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
  -- end
  -- require("alpha").start(false, require("alpha").default_config)
  -- vim.api.nvim_command "SessionManager! load_current_dir_session"
  -- local path = vim.fn.expand "%:p"
  -- if path == "" then
    -- vim.api.nvim_command "SessionManager! load_last_session"
  -- elseif vim.fn.isdirectory(path) == 1 then
    -- vim.api.nvim_command "SessionManager! load_current_dir_session"
  -- else
    -- print("启动时指定的是文件: " .. path)
  -- end
end
