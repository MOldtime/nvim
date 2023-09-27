require "user.config.check" -- 一些检测

vim.opt.list = true
vim.opt.listchars = {
  tab = "---",
  -- lead = "·",
  -- trail = "·",
}

-- 旧的vimscript命令
local vimScript = require "user.config.vimscript"
for i, v in ipairs(vimScript) do
  vim.api.nvim_command(v)
end
