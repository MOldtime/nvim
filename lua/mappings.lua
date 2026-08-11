local utils = require "tools.utils"
-- Normal & Visual 共享快捷键
vim.keymap.set({ "n", "v" }, "<Leader>`", "~", { desc = "把小写转换为大写" })
vim.keymap.set({ "n", "v" }, "<M-h>", "^", { desc = "移动到行首" })
vim.keymap.set({ "n", "v" }, "<M-l>", "$", { desc = "移动到行尾" })

-- Insert & Command 共享快捷键
vim.keymap.set({ "i", "c" }, "<M-p>", "<C-R>+", { desc = "粘贴系统剪切板" })

-- ================= Normal 模式 =================
vim.keymap.set("n", "<Leader>zr", function() vim.cmd("e!") end, { desc = "重新加载文件" })
vim.keymap.set("n", "<leader>zt", function() utils.SetFileType() end, { desc = "设置文件类型" })
vim.keymap.set("n", "<leader>ze", function() utils.SetFileEncoding() end, { desc = "设置文件编码" })
vim.keymap.set("n", "<M-p>", '"+p', { desc = "粘贴系统剪切板" })
vim.keymap.set('n', '<C-i>', '<C-i>', { noremap = true }) -- 防止发送相同的序列导致该功能失效

-- ================= Visual 模式 =================
vim.keymap.set("v", "<M-y>", '"+y', { desc = "复制文字到系统" })
vim.keymap.set("v", "<M-f>", "<Esc>*", { desc = "选中文本在当前的文件搜索" })

-- ================= Insert 模式 =================
vim.keymap.set("i", "<M-h>", "<Esc>^i", { desc = "移动到行首" })
vim.keymap.set("i", "<M-l>", "<Esc>$a", { desc = "移动到行尾" })
vim.keymap.set("i", "<C-v>", "<Nop>") -- 原代码中的 "" 对应 <C-v>

-- 选中左右参数
vim.keymap.set(
  { "x" },
  "<C-h>",
  function() require("vim.treesitter._select").select_prev(vim.v.count1) end,
  { desc = "Select previous treesitter node" }
)

vim.keymap.set(
  { "x" },
  "<C-l>",
  function() require("vim.treesitter._select").select_next(vim.v.count1) end,
  { desc = "Select next treesitter node" }
)

-- 增量或减量选择
vim.keymap.set({ "x", "o" }, "<Enter>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "x", "o" }, "<BS>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })
