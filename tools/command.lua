local M = {}

-- 执行前先返回normal
function M.conmand(command)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.schedule(function() vim.api.nvim_command(command) end)
end

return M
