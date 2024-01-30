return {
  -- nvim-notify
  { "rcarriga/nvim-notify", init = false, config = true },
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
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      -- 覆盖组
      custom_highlights = function(C)
        return {
          Folded = { bg = C.base }, -- 折叠
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
          rosewater = "#cc7983",
          flamingo = "#bb5d60",
          pink = "#d54597",
          mauve = "#a65fd5",
          red = "#b7242f",
          maroon = "#db3e68",
          peach = "#e46f2a",
          yellow = "#bc8705",
          green = "#1a8e32",
          teal = "#00a390",
          sky = "#089ec0",
          sapphire = "#0ea0a0",
          blue = "#017bca",
          lavender = "#8584f7",
          text = "#444444",
          subtext1 = "#555555",
          subtext0 = "#666666",
          overlay2 = "#777777",
          overlay1 = "#888888",
          overlay0 = "#999999",
          surface2 = "#aaaaaa",
          surface1 = "#bbbbbb",
          surface0 = "#cccccc",
          base = "#ffffff",
          mantle = "#eeeeee",
          crust = "#dddddd",
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
}
