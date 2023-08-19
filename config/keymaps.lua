-- 写的插件快捷键

local M = {}

function M.mappings(--[[ map ]])
  -- 检测是否存在的工具
  local utils = require "astronvim.utils"
  local is_available = utils.is_available
  if is_available "vim-visual-multi" then
    -- visual multi
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
      ["Add Cursor Up"] = "<C-S-k>",
      ["Add Cursor Down"] = "<C-S-j>",
      ["Select All"] = "<C-S-n>",
      ["Skip Region"] = "<C-x>",
    }
  end
end

return M
