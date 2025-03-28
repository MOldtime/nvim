for _, value in ipairs {
  "lan zh_CN.UTF-8", -- 设置语言为中文
} do
  vim.api.nvim_command(value)
end
