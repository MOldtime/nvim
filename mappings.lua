-- mnode http://yyq123.github.io/learn-vim/learn-vi-51-KeyMapping.html
return {
  [""] = {
    ['<leader>`'] = { '~',             desc = '把小写转换为大写'},
    ["<M-p>"]     = { "<middlemouse>", desc = "粘贴系统剪切板" },
    ['<leader>r'] = {function() vim.api.nvim_command('e!') end, desc = '重新加载文件'},
  },
  ['!'] = {
    ["<M-p>"] = { "<middlemouse>", desc = "输入时粘贴系统剪切板" },
  },
  -- first key is the mode
  n = {
    ["<M-p>"]   = { '"+p',       desc = "输入时粘贴系统剪切板" },
    ["<tab>"]   = { "v>",        desc = "缩进" },
    ["<s-tab>"] = { "v<",        desc = "缩进" },
    ["<M-h>"]   = { "^",         desc = "移动到行首" },
    ["<M-l>"]   = { "$",         desc = "移动到行尾" },
    ["<c-s-j>"] = { ":m +1<CR>", desc = "选择当前向下移动" },
    ["<c-s-k>"] = { ":m -2<CR>", desc = "选择当前向上移动" },
  },
  v = {
    ["<c-s-j>"] = { ":m '>+1<CR>gv", desc = "选择当前向下移动" },
    ["<c-s-k>"] = { ":m '<-2<CR>gv", desc = "选择当前向上移动" },
    ["<M-l>"]   = { "$",             desc = "移动到行尾" },
    ["<M-h>"]   = { "^",             desc = "移动到行首" },
    ["<M-y>"]   = { '"+y',           desc = "复制文字到系统" },
  },
  t = {},
  i = {
    ["<M-h>"] = { "<Esc>^i", desc = "移动到行首" },
    ["<M-l>"] = { "<Esc>$a", desc = "移动到行尾" },
  },
  c = {},
}
