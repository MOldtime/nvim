return {
  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    init = false,
    opts = {
      stages = "fade_in_slide_out",
      render = "compact",
      timeout = 1000,
    },
    config = true,
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
        -- signature = { enabled = false },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
          view = nil, -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {}, -- merged with defaults from documentation
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
      },
      routes = {
        { filter = { event = "msg_show", min_height = 20 }, view = "messages" }, -- send long messages to split
        { filter = { event = "msg_show", find = "%d+L,%s%d+B" }, opts = { skip = true } }, -- skip save notifications
        { filter = { event = "msg_show", find = "^%d+ more lines$" }, opts = { skip = true } }, -- skip paste notifications
        { filter = { event = "msg_show", find = "^%d+ fewer lines$" }, opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked$" }, opts = { skip = true } }, -- skip yank notifications
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  -- theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = vim.g.transparent_background,
      show_end_of_buffer = true,
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "bold", "italic" },
        loops = { "bold", "italic" },
        functions = { "bold", "italic" },
        keywords = { "bold", "italic" },
        strings = { "bold" },
        variables = { "bold" },
        numbers = { "bold" },
        booleans = { "bold" },
        properties = { "bold" },
        types = { "bold", "italic" },
        operators = { "bold" },
      },
      -- 覆盖组
      custom_highlights = function(C)
        return {
          Folded = { bg = C.base }, -- 用于闭合折叠的线
          FoldColumn = { fg = C.red },
          LineNr = { fg = C.overlay0 }, -- 左边的未选的中的行号颜色
          CursorLine = { bg = C.base }, -- 行颜色
          StatusLine = { fg = C.text, bg = C.base },
        }
      end,
      integrations = {
        aerial = true,
        alpha = true,
        gitsigns = true,
        leap = true,
        markdown = true,
        mason = true,
        mini = {
          enabled = true,
          indentscope_color = "blue",
        },
        neotree = true,
        noice = true,
        cmp = true,
        dap = { enabled = true, enable_ui = true },
        native_lsp = {
          enabled = true,
          inlay_hints = {
            background = true,
          },
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        notify = true,
        semantic_tokens = true,
        treesitter_context = true,
        treesitter = true,
        nvimtree = false,
        ts_rainbow = true,
        ts_rainbow2 = true,
        symbols_outline = true,
        telescope = true,
        lsp_trouble = true,
        which_key = true,
        headlines = true,
        sandwich = true,
      },
      color_overrides = {
        mocha = {
          rosewater = "#efc9c2",
          flamingo = "#ebb2b2",
          pink = "#f2a7de",
          mauve = "#b889f4",
          red = "#ea7183",
          maroon = "#ea838c",
          peach = "#f39967",
          yellow = "#eaca89",
          green = "#96d382",
          teal = "#78cec1",
          sky = "#91d7e3",
          sapphire = "#68bae0",
          blue = "#739df2",
          lavender = "#a0a8f6",
          text = "#b5c1f1",
        },
        latte = {
          rosewater = "#a43b35",
          flamingo = "#da3537",
          pink = "#d332a1",
          mauve = "#aa3685",
          red = "#ff3532",
          maroon = "#de3631",
          peach = "#f36c0b",
          yellow = "#bd8800",
          green = "#596600",
          teal = "#287e5e",
          sky = "#52b1c7",
          sapphire = "#3fb4b8",
          blue = "#317da7",
          lavender = "#474155",
          text = "#4d4742",
          subtext1 = "#5b5549",
          subtext0 = "#6d6655",
          overlay2 = "#786d5a",
          overlay1 = "#8c7c62",
          overlay0 = "#a18d66",
          surface2 = "#c9bea5",
          surface1 = "#d8d3ba",
          surface0 = "#e8e2c8",
          base = "#ebe4c8",
          mantle = "#e1dab5",
          crust = "#bdc0a0",
        },
      },
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
        winhighlight = true,
      },
    },
    config = function(_, opts)
      local ignore_filetypes = { "neo-tree" }
      local ignore_buftypes = { "nofile", "prompt", "popup" }

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
