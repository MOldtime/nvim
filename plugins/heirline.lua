return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"

      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { icon = { kind = "VimIcon", padding = { right = 1} } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info { padding = { right = 1 }, },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        -- remove the 2nd mode indicator on the right
      }
      opts.winbar = nil
      return opts
    end,
  },
}
