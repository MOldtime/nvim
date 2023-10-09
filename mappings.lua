-- mnode http://yyq123.github.io/learn-vim/learn-vi-51-KeyMapping.html
--					                                          		*map-table*
-- Mode           | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- Command        +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
return {
  [""] = {
    ["<leader>`"] = { "~", desc = "把小写转换为大写" },
    ["<M-p>"] = { "<middlemouse>", desc = "粘贴系统剪切板" },
    ["<leader>r"] = { function() vim.api.nvim_command "e!" end, desc = "重新加载文件" },
  },
  ["!"] = {
    ["<M-p>"] = { "<middlemouse>", desc = "粘贴系统剪切板" },
  },
  -- first key is the mode
  n = {
    ["<M-p>"] = { '"+p', desc = "输入时粘贴系统剪切板" },
    ["<tab>"] = { "v>", desc = "缩进" },
    ["<s-tab>"] = { "v<", desc = "缩进" },
    ["<M-h>"] = { "^", desc = "移动到行首" },
    ["<M-l>"] = { "$", desc = "移动到行尾" },
    ["<c-s-j>"] = { function() vim.api.nvim_command "m +1" end, desc = "选择当前向下移动" },
    ["<c-s-k>"] = { function() vim.api.nvim_command "m -2" end, desc = "选择当前向上移动" },
  },
  v = {
    ["<c-s-j>"] = {
      function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
        vim.schedule(function()
          local start_pos = vim.fn.getpos "'<"
          local end_pos = vim.fn.getpos "'>"
          local end_line = end_pos[2]
          vim.api.nvim_command(start_pos[2] .. "," .. end_line .. "m" .. end_line + 1)
          vim.api.nvim_input "gv"
        end)
      end,
      desc = "选择当前向下移动",
    },
    ["<c-s-k>"] = {
      function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
        vim.schedule(function()
          local start_pos = vim.fn.getpos "'<"
          local end_pos = vim.fn.getpos "'>"
          local start_line = start_pos[2]
          vim.api.nvim_command(start_line .. "," .. end_pos[2] .. "m" .. start_line - 2)
          vim.api.nvim_input "gv"
        end)
      end,
      desc = "选择当前向上移动",
    },
    ["<M-l>"] = { "$", desc = "移动到行尾" },
    ["<M-h>"] = { "^", desc = "移动到行首" },
    ["<M-y>"] = { '"+y', desc = "复制文字到系统" },
  },
  t = {},
  i = {
    ["<M-h>"] = { "<Esc>^i", desc = "移动到行首" },
    ["<M-l>"] = { "<Esc>$a", desc = "移动到行尾" },
  },
  c = {},
}
