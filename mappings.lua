return {
  -- first key is the mode
  n = {
    ["<M-p>"]     = { '"+p', desc = "输入时粘贴系统剪切板" },
    ["<tab>"]     = { "v>", desc = "缩进" },
    ["<s-tab>"]   = { "v<", desc = "缩进" },
    ["<M-h>"]     = { "^", desc = "移动到行首" },
    ["<M-l>"]     = { "$", desc = "移动到行尾" },
    ['<leader>r'] = {function() vim.api.nvim_command('e!') end, desc = '重新加载文件'},
  },
  v = {
    ["J"]     = { ":m '>+1<CR>gv=gv", desc = "选择当前向下移动" },
    ["K"]     = { ":m '<-2<CR>gv=gv", desc = "选择当前向上移动" },
    ["<M-y>"] = { '"+y', desc = "复制文字到系统" },
    ["<M-p>"] = { "<middlemouse>", desc = "从系统粘贴" },
    ["<M-h>"] = { "^", desc = "移动到行首" },
    ["<M-l>"] = { "$", desc = "移动到行尾" },
  },
  t = {},
  i = {
    ["<M-h>"] = { "<Esc>^i", desc = "移动到行首" },
    ["<M-l>"] = { "<Esc>$a", desc = "移动到行尾" },
    ["<M-p>"] = { "<middlemouse>", desc = "输入时粘贴系统剪切板" },
  },
  c = {
    ["<M-p>"] = { "<middlemouse>", desc = "输入时粘贴系统剪切板" },
  },
}
