return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    -- 这里可以理解为要安装的语言
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "c",
      'cpp',
      'rust',
      "lua",
      "vim",
      "vimdoc",
      "query",
      'html',
      'java',
      'javascript',
      'jsdoc',
      'kotlin',
      'typescript',
      'css',
      'yaml',
      'toml',
      'xml',
      'json',
      'json5',
      'markdown',
    })
  end,
}
