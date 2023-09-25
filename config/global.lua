require "user.config.check" -- 检测是不是由指定的idea 打开
require "user.config.config"

-- 全局nvim配置
local vimScript = require "user.config.vimscript"

for i, v in ipairs(vimScript) do
  vim.api.nvim_command(v)
end
