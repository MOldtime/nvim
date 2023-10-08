require "user.config.check" -- 一些检测

-- 旧的vimscript命令
local vimScript = require "user.config.vimscript"
for _, v in ipairs(vimScript) do
  vim.api.nvim_command(v)
end
