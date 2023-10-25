-- ide 的检测, 并启动不同的设置
if vim.g.neovide then require "user.config.ide.neovide" end

local VimScript_list = {
  "lan zh_CN.UTF-8", -- 设置语言为中文
}

for _, v in ipairs(VimScript_list) do
  vim.api.nvim_command(v)
end
