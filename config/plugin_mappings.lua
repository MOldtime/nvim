local utils = require "astronvim.utils"
local maps = utils.empty_map_table() -- 可能是mappings
local is_available = utils.is_available
if is_available "vim-visual-multi" then
  -- visual multi
  vim.g["VM_default_mappings"] = 0
  vim.g.VM_maps = {
    ["Add Cursor Up"] = "<C-Up>",
    ["Add Cursor Down"] = "<C-Down>",
  }
end

if is_available "telescope.nvim" then
  maps.v["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" }
end

utils.set_mappings(astronvim.user_opts("mappings", maps)) -- 写入
