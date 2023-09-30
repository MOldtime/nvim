local utils = require "astronvim.utils"
local is_available = utils.is_available
if is_available "vim-visual-multi" then
  -- visual multi
  vim.g["VM_default_mappings"] = 0
  vim.g.VM_maps = {
    ["Add Cursor Up"] = "<C-k>",
    ["Add Cursor Down"] = "<C-j>",
  }
end
