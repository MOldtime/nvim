local utils = require "astronvim.utils"
local tool = require "user.tools.command"
local tus = require "user.tools.utils"
local maps = require("astronvim.utils").set_mappings
local is_available = utils.is_available

if is_available "nvim-notify" then
  maps {
    n = {
      ["<leader>za"] = {
        function() require("notify").dismiss { silent = true } end,
        desc = "关闭通知",
      },
    },
  }
end

if is_available "telescope.nvim" then
  local builtin = require "telescope.builtin"
  maps {
    v = {
      ["<leader>fc"] = {
        function()
          tool.LazyConmand(function() builtin.grep_string { search = tus.Gets_selected_text() } end)
        end,
        desc = "Find Selected Content",
      },
      ["<leader>ff"] = {
        function()
          tool.LazyConmand(function() builtin.find_files { search_file = tus.Gets_selected_text() } end)
        end,
        desc = "Find Selected files",
      },
    },
  }
end
