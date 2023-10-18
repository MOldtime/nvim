local M = {}

-- 执行前先返回normal
function M.conmand(command)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.schedule(function() vim.api.nvim_command(command) end)
end

-- 在执行前返回normal, 再运行之后程序
--- @param func function 到normal后运行的函数
--- @return nil 没有返回值
function M.LazyConmand(func)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.schedule(func)
end

return M
