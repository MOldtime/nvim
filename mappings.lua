-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- 些官方自带的功能
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },

    -- navigate buffer tabs with `H` and `L`
    ["<C-L>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<C-H>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- mappings seen under group name "Buffer"
    ["<leader>;p"] = {
      '"*p',
      desc = "从系统粘贴",
    },
    ["<leader>;f"] = {
      "<cmd>Format<cr>",
      desc = "格式化代码",
    },
    ["<tab>"] = {
      "v>",
      desc = "缩进",
    },
    ["<s-tab>"] = {
      "v<",
      desc = "缩进",
    },
    ["<A-h>"] = {
      "^",
      desc = "移动到行首",
    },
    ["<A-l>"] = {
      "$",
      desc = "移动到行尾",
    },
  },
  v = {
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      desc = "选择当前向下移动",
    },
    ["K"] = {
      ":m '>-2<CR>gv=gv",
      desc = "选择当前向上移动",
    },
    ["<C-y>"] = {
      '"+y',
      desc = "复制文字到系统",
    },
    ["<A-h>"] = {
      "^",
      desc = "移动到行首",
    },
    ["<A-l>"] = {
      "$",
      desc = "移动到行尾",
    },
    ["<tab>"] = {
      ">gv",
      desc = "缩进",
    },
    ["<s-tab>"] = {
      "<gv",
      desc = "缩进",
    },
  },
  t = {},
  i = {
    ["<A-h>"] = {
      "<Esc>^i",
      desc = "移动到行首",
    },
    ["<A-l>"] = {
      "<Esc>$a",
      desc = "移动到行尾",
    },
  },
}
