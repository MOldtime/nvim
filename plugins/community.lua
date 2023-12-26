return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "╎",
      options = { try_as_border = true, indent_at_cursor = true },
    },
  },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },

  { import = "astrocommunity.lsp.lsp-signature-nvim" },
}
