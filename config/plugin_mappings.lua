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

-- if is_available "search-replace.nvim" then
--   maps {
--     n = {
--       ["<leader>rs"] = {
--         function() vim.api.nvim_command "SearchReplaceSingleBufferSelections" end,
--         desc = "SearchReplaceSingleBuffer [s]elction list",
--       },
--       ["<leader>ro"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferOpen" end, desc = "[o]pen" },
--       ["<leader>rw"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWord" end, desc = "[w]ord" },
--       ["<leader>rW"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWORD" end, desc = "[W]ORD" },
--       ["<leader>re"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCExpr" end, desc = "[e]xpr" },
--       ["<leader>rf"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCFile" end, desc = "[f]ile" },
--       ["<leader>rbs"] = {
--         function() vim.api.nvim_command "SearchReplaceMultiBufferSelections" end,
--         desc = "SearchReplaceMultiBuffer [s]elction list",
--       },
--       ["<leader>rbo"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferOpen" end, desc = "[o]pen" },
--       ["<leader>rbw"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWord" end, desc = "[w]ord" },
--       ["<leader>rbW"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWORD" end, desc = "[W]ORD" },
--       ["<leader>rbe"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCExpr" end, desc = "[e]xpr" },
--       ["<leader>rbf"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCFile" end, desc = "[f]ile" },
--     },
--     v = {
--       ["<C-r>"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferVisualSelection" end },
--       ["<C-s>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelection" end },
--       ["<C-b>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelectionCWord" end },
--     },
--   }
-- end

if is_available "vim-bitoai" then
end
