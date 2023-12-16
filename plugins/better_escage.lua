-- 用于绑定<leader>
return {
  "max397574/better-escape.nvim",
  opts = function(_, opts)
    opts.mapping = { "jk", "fj" }
    opts.timeout = 200
    return opts
  end,
}
