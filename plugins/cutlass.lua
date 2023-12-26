-- Cutlass 会覆盖删除操作，实际上只是删除而不影响当前的复制
return {
  "gbprod/cutlass.nvim",
  event = { "User AstroFile" },
  opts = {
    cut_key = "x", -- 剪切
  },
}
