-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

for _, value in ipairs {
  "lan zh_CN.UTF-8", -- 设置语言为中文
} do
  vim.api.nvim_command(value)
end
