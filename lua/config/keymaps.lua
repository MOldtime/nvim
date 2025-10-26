-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- if true then
-- 	return {}
-- end


local map = LazyVim.safe_keymap_set
local utils = require("tools.utils")

map({ "n", "v", "s", "o" }, "<Leader>`", "~", { desc = "把小写转换为大写" })
map({ "n", "v", "s", "o" }, "<Leader>zr", function()
vim.api.nvim_command("e!")
 end, { desc = "重新加载文件" })

map({ "i", "c" }, "<M-p>", "<C-R>+", { desc = "粘贴系统剪切板" })

map("n", "<M-p>", '"+p', { desc = "粘贴系统剪切板" })

map("n", "<M-h>", "^", { desc = "移动到行首" })
map("n", "<M-l>", "$", { desc = "移动到行尾" })
map("n", "<leader>zt", function()
	utils.SetFileType()
end, { desc = "设置文件类型" })
map("n", "<leader>ze", function()
	utils.SetFileEncoding()
end, { desc = "设置文件编码" })

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save File" })
--
-- -- navigate buffer tabs with `H` and `L`
map("n", "L", function()
	require("astrocore.buffer").nav(vim.v.count1)
end, { desc = "Next buffer" })
map("n", "H", function()
	require("astrocore.buffer").nav(-vim.v.count1)
end, { desc = "Previous buffer" })
--
-- -- this is useful for naming menus
-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
--
map("v", "<M-l>", "$", { desc = "移动到行尾" })
map("v", "<M-h>", "^", { desc = "移动到行首" })
map("v", "<M-y>", '"+y', { desc = "复制文字到系统" })
map("v", "<M-f>", "<Esc>*", { desc = "选中文本在当前的文件搜索" })
--
map("i", "<M-h>", "<Esc>^i", { desc = "移动到行首" })
map("i", "<M-l>", "<Esc>$a", { desc = "移动到行尾" })
-- -- 方便写中文
map("i", "<M-j>", "<Esc>")
map("i", "", "") -- 

map("c", "<M-l>", "<Right>")
map("c", "<M-h>", "<Left>")
