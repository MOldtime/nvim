-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
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
      ":m '<-2<CR>gv=gv",
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
    ["<C-v>"] = {
      "<C-r>*",
      desc = "输入时粘贴",
    },
  },
  c = {
    ["<C-v>"] = {
      "<C-r>*",
      desc = "输入时粘贴",
    },
  },
}
