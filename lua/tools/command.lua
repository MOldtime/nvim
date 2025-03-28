local M = {}

-- 在执行前返回normal, 再运行之后程序
--- @param func function 到normal后运行的函数
--- @return nil 没有返回值
function M.LazyConmand(func)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.schedule(func)
end

-- 执行
--- @param command string 命令
--- @param mode string  模式
function M.Conmand(command, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), mode, true)
end

return M
