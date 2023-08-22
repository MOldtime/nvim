return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  -- indent
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "╎",
      options = { try_as_border = false, indent_at_cursor = true },
    },
  },
  -- - {
  --   import = "astrocommunity.colorscheme.rose-pine",
  -- },
}
