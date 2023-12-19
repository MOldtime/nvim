--[[
    ColorColumn: 列号栏的背景色。
    Conceal: 被隐藏文本的占位字符的颜色。
    Cursor: 光标下的字符的颜色和背景色。
    lCursor: 使用语言映射时光标下的字符的颜色和背景色。
    CursorIM: 插入模式下光标的颜色和背景色。
    CursorColumn: 设置 'cursorcolumn' 时的光标所在列的背景色。
    CursorLine: 设置 'cursorline' 时的光标所在行的背景色。
    Directory: 目录名和其他特殊名称的颜色。
    EndOfBuffer: 缓冲区结尾后的填充行 (约号) 的颜色。
    ErrorMsg: 命令行上的错误消息的颜色和样式。
    VertSplit: 垂直分割窗口之间的列的颜色。
    Folded: 关闭折叠处的行颜色。
    FoldColumn: 'foldcolumn' 的颜色。
    SignColumn: 显示符号的列的颜色。
    SignColumnSB: 显示符号的列在侧边栏时的颜色。
    Substitute: ':substitute' 替换文本高亮的背景色和前景色的变化。
    LineNr: 行号 (":number" 和 ":#" 命令) 的颜色。
    CursorLineNr: 设置 'cursorline' 或 'relativenumber' 时光标所在行的行号颜色。
    MatchParen: 光标下的字符或其前一个配对括号及其匹配项的颜色和样式。
    ModeMsg: 显示模式消息 (例如 "-- INSERT -- ") 的颜色和样式。
    MsgArea: 消息和命令行区域的颜色 (注释建议不要设置此高亮)。
    MsgSeparator: 滚动消息的分隔符颜色。
    MoreMsg: ':more-prompt' 的颜色。
    NonText: 窗口末尾的 '@' 符号，显示断行和其他不存在于文本中的字符 (例如，行末无法容纳双宽字符时显示的 ">" 符号)。
    Normal: 普通文本的颜色和背景色。
    NormalNC: 非当前窗口中的普通文本的颜色和背景色。
    NormalSB: 非当前窗口中的普通文本在侧边栏的颜色。
    NormalFloat: 浮动窗口中普通文本的颜色和背景色。
    FloatBorder: 浮动窗口边框的颜色。
    FloatTitle: 浮动窗口标题的颜色。
    Pmenu: 弹出菜单正常项的背景色和前景色。
    PmenuSel: 弹出菜单选中项的背景色和样式。
    PmenuSbar: 弹出菜单滚动条的背景色。
    PmenuThumb: 弹出菜单滚动条滑块的背景色。
    : ':hit-enter' 提示和 "是/否" 问题的颜色。
    QuickFixLine: quickfix 窗口中当前项目的背景色和样式。
    Search: 上次搜索模式高亮的背景色和前景色。
    IncSearch: 'incsearch' 高亮颜色；也用于 ":s///c" 替换的文本。
    CurSearch: 'cursearch' 高亮颜色：突出显示当前搜索内容。
    SpecialKey: 非可打印字符的颜色。
    SpellBad: 拼写检查器无法识别的单词的颜色和样式。
    SpellCap: 应该首字母大写的单词的颜色和样式。
    SpellLocal: 拼写检查器认为在另一个区域使用的单词的颜色和样式。
    SpellRare: 拼写检查器认为很少使用的单词的颜色和样式。
    StatusLine: 当前窗口的状态栏颜色。
    StatusLineNC: 非当前窗口的状态栏颜色。
    TabLine: 标签页行非激活标签页标签的颜色。
    TabLineFill: 标签页行没有标签的地方的颜色。
    TabLineSel: 标签页行激活标签页标签的颜色。
    Title: ':set all'、':autocmd' 等输出的标题颜色。
    Visual: 可视模式选区的背景色和样式。
    VisualNOS: vim "不拥有选择"时的可视模式选区的背景色和样式。
    WarningMsg: 警告消息的颜色。
    Whitespace: 'listchars'
]]
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
    -- 覆盖组
    custom_highlights = function(C)
      return {
        Folded = { bg = C.base }, -- 折叠
        LineNr = { fg = C.overlay0 }, -- 未选中行颜色
        Visual = { bg = "#5A6377"}
      }
    end,
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
}
