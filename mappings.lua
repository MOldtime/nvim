-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>;p"] = {
      '"*p',
      desc = "从系统粘贴",
    },
    ["<tab>"] = {
      "v>",
      desc = "缩进",
    },
    ["<s-tab>"] = {
      "v<",
      desc = "缩进",
    },
    ["C-L"] = {
      ":bnext<CR>",
      desc = "向右切换标签",
    },
    ["<C-H>"] = {
      ":bprevious<CR>",
      desc = "向左切换标签",
    },
  },
  v = {
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      "选择当前向下移动",
    },
    ["K"] = {
      ":m '>-2<CR>gv=gv",
      "选择当前向上移动",
    },
    ["<C-y>"] = {
      '"+y',
      desc = "复制文字到系统",
    },
    ["H"] = {
      "^",
      desc = "移动到行首",
    },
    ["L"] = {
      "$",
      desc = "快捷移动到行尾",
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
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["fj"] = {
      "<Esc>",
      desc = "一眼便知",
    },
  },
}
