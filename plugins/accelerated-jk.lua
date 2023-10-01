-- 使 j,k 移动更快
return {
  "rhysd/accelerated-jk",
  opts = function()
    vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
    vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
  end,
}
