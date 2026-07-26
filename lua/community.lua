---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.pack.go" },
}
