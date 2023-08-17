require "user.config.check"; -- 检测是不是由指定的idea 打开
-- 全局nvim配置
local vimScript = require "user.config.vimscript";

print("执行配置文件")
for i,v in ipairs(vimScript) do
    vim.api.nvim_command(v);
end

