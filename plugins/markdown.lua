return {
  {
    "iamcco/markdown-preview.nvim",
    -- edable = false
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    lazy = false,
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function() vim.g.mkdp_theme = "dark" end,
  },
}
