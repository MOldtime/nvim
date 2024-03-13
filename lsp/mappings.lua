return function(tables)
  -- tables.n["gd"] = {
  --   function()
  --     vim.cmd.vsplit()
  --     vim.lsp.buf.definition()
  --   end,
  --   desc = "显示当前符号的定义",
  -- }
  require("user.config.translation").Lsp(tables)
  return tables
end
