-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
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
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  -- import/override with your plugins folder
}
