return {
  -- log
  {
    -- 对Log加上颜色
    "fei6409/log-highlight.nvim",
    event = "VeryLazy",
    config = function() require("log-highlight").setup {} end,
  },
}
