return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      local highlight = {
        "RainbowDefalut",
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(
        hooks.type.HIGHLIGHT_SETUP,
        function() vim.api.nvim_set_hl(0, "RainbowDefalut", { fg = "#3b4048" }) end
      )
      opts.indent = {
        highlight = highlight,
      }
    end,
  },
}
