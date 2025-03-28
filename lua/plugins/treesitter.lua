-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      -- 使用回车或退格选择范围
      keymaps = {
        init_selection = "gnn",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
      },
    },
    ensure_installed = {
      "c",
      "cpp",
      "rust",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "html",
      "java",
      "javascript",
      "jsdoc",
      "kotlin",
      "typescript",
      "css",
      "yaml",
      "toml",
      "xml",
      "json",
      "json5",
      "markdown",
      "markdown_inline",
      "bash",
      "regex",
    },
  },
  config = function(_, opts)
    -- local utils = require "user.tools.utils"
    opts.textobjects.select.keymaps["ad"] = opts.textobjects.select.keymaps["a?"]
    opts.textobjects.select.keymaps["id"] = opts.textobjects.select.keymaps["i?"]
    opts.textobjects.select.keymaps["a?"] = nil
    opts.textobjects.select.keymaps["i?"] = nil
    -- 翻译
    require("nvim-treesitter.configs").setup(opts)
  end,
}
