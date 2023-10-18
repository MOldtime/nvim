local utils = require "astronvim.utils"
local tool = require "user.tools.command"
local maps = utils.empty_map_table() -- 可能是mappings
local is_available = utils.is_available
if is_available "vim-visual-multi" then
  -- visual multi
  vim.g["VM_default_mappings"] = 0
  vim.g.VM_maps = {
    ["Add Cursor Down"] = "<S-NL>",
    ["Add Cursor Up"] = "<C-S-K>",
  }
end

if is_available "telescope.nvim" then
  maps.v["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" }
end

if is_available "pastify.nvim" then
  maps.n["<leader>zp"] = {
    function() vim.api.nvim_command "Pastify" end,
    desc = "粘贴图片文件",
  }
end

if is_available "search-replace.nvim" then
  maps.n["<leader>rs"] = {
    function() vim.api.nvim_command "SearchReplaceSingleBufferSelections" end,
    desc = "SearchReplaceSingleBuffer [s]elction list",
  }
  maps.n["<leader>ro"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferOpen" end, desc = "[o]pen" }
  maps.n["<leader>rw"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWord" end, desc = "[w]ord" }
  maps.n["<leader>rW"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWORD" end, desc = "[W]ORD" }
  maps.n["<leader>re"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCExpr" end, desc = "[e]xpr" }
  maps.n["<leader>rf"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCFile" end, desc = "[f]ile" }
  maps.n["<leader>rbs"] = {
    function() vim.api.nvim_command "SearchReplaceMultiBufferSelections" end,
    desc = "SearchReplaceMultiBuffer [s]elction list",
  }
  maps.n["<leader>rbo"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferOpen" end, desc = "[o]pen" }
  maps.n["<leader>rbw"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWord" end, desc = "[w]ord" }
  maps.n["<leader>rbW"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWORD" end, desc = "[W]ORD" }
  maps.n["<leader>rbe"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCExpr" end, desc = "[e]xpr" }
  maps.n["<leader>rbf"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCFile" end, desc = "[f]ile" }
  maps.v["<C-r>"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferVisualSelection" end }
  maps.v["<C-s>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelection" end }
  maps.v["<C-b>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelectionCWord" end }
end

if is_available "vim-bitoai" then
  maps.n["<leader>aq"] = { function() vim.api.nvim_command "BitoAiGenerate" end, desc = "提问" }
  maps.v["<leader>aa"] = {
    function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      vim.schedule(function() vim.fn.BitoAiSelected "generate" end)
    end,
    desc = "选中提问",
  }
  maps.v["<leader>aq"] = {
    function()
      tool.LazyConmand(function()
        local l_start = vim.fn.getpos("'<")[2]
        local l_end = vim.fn.getpos("'>")[2]
        local l_lines = vim.api.nvim_buf_get_lines(0, l_start - 1, l_end, false)
        local l_text = table.concat(l_lines, "\n")
        local input = vim.fn.input "Bito prompt："
        if input == "" then
          vim.notify "Please Input Context!"
          return
        end
        input = input .. "\n以下是内容:\n" .. l_text
        vim.fn.BitoAiExec("generate", input)
      end)
    end,
    desc = "对代码提问",
  }
  maps.v["<leader>agu"] = {
    function()
      tool.LazyConman(function() vim.api.nvim_command "BitoAiGenerateUnit" end)
    end,
    desc = "生成测试",
  }
  maps.v["<leader>agc"] = {
    function()
      tool.LazyConmand(function() vim.api.nvim_command "BitoAiGenerateComment" end)
    end,
    desc = "生成注释，解释参数和输出",
  }
  maps.v["<leader>acc"] = {
    function()
      tool.LazyConmand(function() vim.api.nvim_command "BitoAiCheck" end)
    end,
    desc = "检测代码潜在问题",
  }
  maps.v["<leader>acs"] = {
    function()
      tool.LazyConmand(function() vim.api.nvim_command "BitoAiCheckSecurity" end)
    end,
    desc = "检测代码安全",
  }
  maps.v["<leader>acS"] = {
    function()
      tool.LazyConmand(function() vim.api.nvim_command "BitoAiCheckStyle" end)
    end,
    desc = "检测代码样式",
  }
  maps.v["<leader>acp"] = {
    function()
      tool.LazyConmand(function() vim.api.nvim_command "BitoAiCheckPerormance" end)
    end,
    desc = "分析代码性能",
  }
  maps.v["<leader>ar"] = {
    function()
      tool.LazyConmand(function() vim.api.nvim_command "BitoAiReadable" end)
    end,
    desc = "整理代码，增强可读性和可维护性",
  }
  maps.v["<leader>ae"] = {
    function()
      tool.LazyConmand(function() vim.api.nvim_command "BitoAiExplain" end)
    end,
    desc = "生成解释",
  }
end

utils.set_mappings(astronvim.user_opts("mappings", maps)) -- 写入
