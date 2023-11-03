return {
  "folke/which-key.nvim",
  opts = {
    plugins = {
      presets = {
        text_objects = false,
        nav = false,
        windows = false,
        z = false,
        g = false,
      },
    },
  },
  config = function(_, opts)
    require("user.config.translation").whichkey(opts)
    require("which-key").setup(opts)
  end,
}
