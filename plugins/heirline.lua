return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"

      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { icon = { kind = "VimIcon", padding = { right = 1} } } }, -- add the mode text
        -- status.component.file_info { padding = { right = 1 }, },
        {
            status.component.builder{
            	{
    					  provider = function ()
    					   local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
    					   return enc
    					  end,
							},
            surround = { separator = "left", color = "file_info_bg",},
          	}
        },
        status.component.git_branch {
            hl = { fg = "fg", bg = "bg" },
        },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        -- status.component.cmd_info(),
        status.component.lsp{
          lsp_progress = false
        },
        status.component.treesitter(),
        status.component.nav(),
      }
      opts.winbar = nil
      return opts
    end,
  },
}
