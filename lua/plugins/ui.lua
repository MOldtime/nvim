return {
  -- log
  {
    -- 对Log加上颜色
    "fei6409/log-highlight.nvim",
    event = "VeryLazy",
    config = function() require("log-highlight").setup {} end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(highlights, colors)
        highlights.DiagnosticUnnecessary = {
          fg = colors.comment,
        }
      end,
    },
  },
}
