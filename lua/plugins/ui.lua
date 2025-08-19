-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
local maps = require("astrocore").set_mappings
return {
  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- cmdline = { view = "cmdline" },
      messages = { view_search = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
        -- signature = {
        --   enabled = true,
        --   auto_open = {
        --     enabled = true,
        --     trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        --     luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
        --     throttle = 50, -- Debounce lsp signature help request by 50ms
        --   },
        --   view = nil, -- when nil, use defaults from documentation
        --   ---@type NoiceViewOptions
        --   opts = {}, -- merged with defaults from documentation
        -- },
      },
      presets = {
        bottom_search = false,  -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
      },
      routes = {
        { filter = { event = "msg_show", min_height = 20 },             view = "messages" },      -- send long messages to split
        { filter = { event = "msg_show", find = "%d+L,%s%d+B" },        opts = { skip = true } }, -- skip save notifications
        { filter = { event = "msg_show", find = "^%d+ more lines$" },   opts = { skip = true } }, -- skip paste notifications
        { filter = { event = "msg_show", find = "^%d+ fewer lines$" },  opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked$" }, opts = { skip = true } }, -- skip yank notifications
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  -- log
  {
    -- 对Log加上颜色
    "fei6409/log-highlight.nvim",
    event = "VeryLazy",
    config = function() require("log-highlight").setup {} end,
  },
  -- 窗口自动配置
  {
    "nvim-focus/focus.nvim",
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
