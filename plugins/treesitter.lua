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
  end,
}
