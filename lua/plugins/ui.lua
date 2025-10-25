local maps = require("astrocore").set_mappings
return {
  -- log
  {
    -- 对Log加上颜色
    "fei6409/log-highlight.nvim",
    event = "VeryLazy",
    config = function()
      require("log-highlight").setup({})
    end,
  },
  -- 窗口自动配置
  {
    "nvim-focus/focus.nvim",
    enabled = false,
    event = "BufEnter",
    version = "*",
    opts = {
      autoresize = {
        width = 150,
      },
      ui = {
        number = true,
        winhighlight = false,
        signcolumn = false,
      },
    },
    config = function(_, opts)
      local ignore_filetypes = { "neo-tree" }
      local ignore_buftypes = { "nofile", "prompt", "popup", "rip-substitute", "qf" }

      local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

      vim.api.nvim_create_autocmd("WinEnter", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
            vim.w.focus_disable = true
          else
            vim.w.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for BufType",
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
          else
            vim.b.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for FileType",
      })
      require("focus").setup(opts)
    end,
  },
}
