local utils = require "astronvim.utils"
local tool = require "user.tools.command"
local tus = require "user.tools.utils"
local maps = require("astronvim.utils").set_mappings
local is_available = utils.is_available
if is_available "vim-visual-multi" then
  -- visual multi
  vim.g["VM_default_mappings"] = 0
end

if is_available "accelerated-jk.nvim" then
  maps {
    n = {
      j = {
        "<Plug>(accelerated_jk_gj)",
        desc = "向下移动",
      },
      k = {
        "<Plug>(accelerated_jk_gk)",
        desc = "向上移动",
      },
    },
  }
end

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

if is_available "pastify.nvim" then
  maps {
    n = {
      ["<leader>zp"] = {
        function() vim.api.nvim_command "Pastify" end,
        desc = "粘贴图片文件",
      },
    },
  }
end

if is_available "search-replace.nvim" then
  maps {
    n = {
      ["<leader>rs"] = {
        function() vim.api.nvim_command "SearchReplaceSingleBufferSelections" end,
        desc = "SearchReplaceSingleBuffer [s]elction list",
      },
      ["<leader>ro"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferOpen" end, desc = "[o]pen" },
      ["<leader>rw"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWord" end, desc = "[w]ord" },
      ["<leader>rW"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWORD" end, desc = "[W]ORD" },
      ["<leader>re"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCExpr" end, desc = "[e]xpr" },
      ["<leader>rf"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCFile" end, desc = "[f]ile" },
      ["<leader>rbs"] = {
        function() vim.api.nvim_command "SearchReplaceMultiBufferSelections" end,
        desc = "SearchReplaceMultiBuffer [s]elction list",
      },
      ["<leader>rbo"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferOpen" end, desc = "[o]pen" },
      ["<leader>rbw"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWord" end, desc = "[w]ord" },
      ["<leader>rbW"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWORD" end, desc = "[W]ORD" },
      ["<leader>rbe"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCExpr" end, desc = "[e]xpr" },
      ["<leader>rbf"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCFile" end, desc = "[f]ile" },
    },
    v = {
      ["<C-r>"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferVisualSelection" end },
      ["<C-s>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelection" end },
      ["<C-b>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelectionCWord" end },
    },
  }
end

if is_available "vim-bitoai" then
  maps {
    n = {
      ["<leader>aq"] = { function() vim.api.nvim_command "BitoAiGenerate" end, desc = "提问" },
      ["<leader>a"] = { desc = "BitoAi" },
    },
    v = {
      ["<leader>a"] = { desc = "BitoAi" },
      ["<leader>aa"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("generate", tus.Gets_selected_text()) end)
        end,
        desc = "选中提问",
      },
      ["<leader>aq"] = {
        function()
          tool.LazyConmand(function()
            local input = vim.fn.input "Bito prompt："
            if input == "" then
              vim.notify "Please Input Context!"
              return
            end
            input = input .. "\n以下是内容:\n" .. tus.Gets_selected_text()
            vim.fn.BitoAiExec("generate", input)
          end)
        end,
        desc = "对代码提问",
      },
      ["<leader>agu"] = {
        function()
          tool.LazyConman(function() vim.fn.BitoAiExec("generate_unit", tus.Gets_selected_text()) end)
        end,
        desc = "生成测试",
      },
      ["<leader>agc"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("generate_comment", tus.Gets_selected_text()) end)
        end,
        desc = "生成注释，解释参数和输出",
      },
      ["<leader>acc"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("check", tus.Gets_selected_text()) end)
        end,
        desc = "检测代码潜在问题",
      },
      ["<leader>acs"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("check_security", tus.Gets_selected_text()) end)
        end,
        desc = "检测代码安全",
      },
      ["<leader>acS"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("check_style", tus.Gets_selected_text()) end)
        end,
        desc = "检测代码样式",
      },
      ["<leader>acp"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("check_performance", tus.Gets_selected_text()) end)
        end,
        desc = "分析代码性能",
      },
      ["<leader>ar"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("readable", tus.Gets_selected_text()) end)
        end,
        desc = "整理代码，增强可读性和可维护性",
      },
      ["<leader>ae"] = {
        function()
          tool.LazyConmand(function() vim.fn.BitoAiExec("explain", tus.Gets_selected_text()) end)
        end,
        desc = "生成解释",
      },
    },
  }
end
