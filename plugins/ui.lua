return {
  {
    -- lazy.nvim
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = function(_, opts)
      opts.views = {
        mini = {
          timeout = 500,
          win_options = {
            winblend = 100,
          },
        },
      }
      opts.notify = {
        enabled = true,
        view = "notify",
      }
      opts.lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      }
      opts.presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
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
          LineNr = { fg = C.overlay0 }, -- 未选中行颜色
          Visual = { bg = "#5A6377" },
        }
      end,
      integrations = {
        aerial = true,
        alpha = true,
        gitsigns = true,
        indent_blankline = {
          enabled = false,
          colored_indent_levels = true,
        },
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
          subtext1 = "#a6b0d8",
          subtext0 = "#959ec2",
          overlay2 = "#848cad",
          overlay1 = "#717997", -- 未知
          overlay0 = "#9599AD", -- 注释颜色
          surface2 = "#505469", -- 未知
          surface1 = "#3E4255", -- 其它颜色
          surface0 = "#282C34", -- 行颜色
          base = "#282C34", -- 代码编写区域背景
          mantle = "#282C34", -- tree树背景
          crust = "#282C34", -- tree与代码编写分隔线
        },
      },
    },
  },
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>zi", mode = { "n" }, "<cmd>CellularAutomaton make_it_rain<CR>", desc = "散落" },
    },
  },
  {
    -- 对Log加上颜色
    "fei6409/log-highlight.nvim",
    lazy = false,
    config = function() require("log-highlight").setup {} end,
  },
  {
    -- 使其它内容变暗
    "folke/twilight.nvim",
    lazy = false,
    enabled = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
