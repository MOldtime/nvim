return {
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
    custom_highlights = {},
    integrations = {
      aerial = true,
      alpha = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      leap = true,
      markdown = true,
      mason = true,
      mini = true,
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
        overlay0 = "#777B93", -- 注释颜色
        surface2 = "#505469", -- 未知
        surface1 = "#3E4255", -- 其他颜色
        surface0 = "#1A1C2A", -- 行颜色
        base = "#1A1C2A", -- 代码编写区域背景
        mantle = "#1A1C2A", -- tree树背景
        crust = "#1A1C2A", -- tree与代码编写分隔线
      },
    },
  },
}
