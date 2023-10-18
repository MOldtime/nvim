return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- 这里可以理解为要安装的语言
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
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
    })
    -- local value = opts.textobjects.select.keymaps
    opts.textobjects.select.keymaps["ad"] = opts.textobjects.select.keymaps["a?"]
    opts.textobjects.select.keymaps["id"] = opts.textobjects.select.keymaps["i?"]

    opts.textobjects.select.keymaps["a?"] = nil
    opts.textobjects.select.keymaps["i?"] = nil

    -- 使用回车或返回选择范围
    local incremental_selection_keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "<CR>",
      -- scope_incremental = "grc",
      node_decremental = "<BS>",
    }
    opts.incremental_selection.keymaps = incremental_selection_keymaps
  end,
}
