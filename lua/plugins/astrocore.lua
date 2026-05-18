local utils = require "tools.utils"
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = false, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        clipboard = "",
        expandtab = false, -- tab space
        list = true,
        termguicolors = true, -- 开启真彩色
        listchars = {
          tab = "---",
        },
        inccommand = "split", -- 在实时预览窗口中显示搜索/替换的效果
        cmdheight = 1,
        smartindent = true,
        guicursor = "n-v-c-sm:block,r-cr-o:hor20,i-ci-ve:ver20-blinkwait250-blinkoff700-blinkon700",
        jumpoptions = "stack", -- 改变 ctrl + o 跳转的方式
      },
      g = { -- vim.g.<key>
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = true, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
        inlay_hints_enabled = true,
      },
    },
    mappings = {
      n = {
        ["<Leader>zr"] = {
          function() vim.api.nvim_command "e!" end,
          desc = "重新加载文件",
        },
        ["<leader>zt"] = { function() utils.SetFileType() end, desc = "设置文件类型" },
        ["<leader>ze"] = { function() utils.SetFileEncoding() end, desc = "设置文件编码" },
        ["<Leader>`"] = { "~", desc = "把小写转换为大写" },
        ["<M-p>"] = { '"+p', desc = "粘贴系统剪切板" },
        ["<M-h>"] = { "^", desc = "移动到行首" },
        ["<M-l>"] = { "$", desc = "移动到行尾" },
      },
      v = {
        ["<Leader>`"] = { "~", desc = "把小写转换为大写" },
        ["<M-l>"] = { "$", desc = "移动到行尾" },
        ["<M-h>"] = { "^", desc = "移动到行首" },
        ["<M-y>"] = { '"+y', desc = "复制文字到系统" },
        ["<M-f>"] = { "<Esc>*", desc = "选中文本在当前的文件搜索" },
      },
      i = {
        ["<M-p>"] = { "<C-R>+", desc = "粘贴系统剪切板" },
        ["<M-h>"] = { "<Esc>^i", desc = "移动到行首" },
        ["<M-l>"] = { "<Esc>$a", desc = "移动到行尾" },
        ["<M-j>"] = { "<Esc>" },
        [""] = { "" },
      },
      c = {
        ["<M-p>"] = { "<C-R>+", desc = "粘贴系统剪切板" },
        ["<M-l>"] = {
          "<Right>",
        },
        ["<M-h>"] = {
          "<Left>",
        },
      },
    },
  },
}
