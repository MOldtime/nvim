-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
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
    autocmds = {
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        },
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
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
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
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- :help map-table
      [""] = {
        ["<Leader>`"] = { "~", desc = "把小写转换为大写" },
        ["<Leader>zr"] = { function() vim.api.nvim_command "e!" end, desc = "重新加载文件" },
      },
      ["!"] = {
        ["<M-p>"] = { "<C-R>+", desc = "粘贴系统剪切板" },
      },
      n = {
        ["<M-p>"] = { '"+p', desc = "粘贴系统剪切板" },
        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader>h"] = nil,
        ["<M-h>"] = { "^", desc = "移动到行首" },
        ["<M-l>"] = { "$", desc = "移动到行尾" },
        ["<leader>zt"] = {
          function() utils.SetFileType() end,
          desc = "设置文件类型",
        },
        ["<leader>ze"] = {
          function() utils.SetFileEncoding() end,
          desc = "设置文件编码",
        },
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      v = {
        ["<M-l>"] = { "$", desc = "移动到行尾" },
        ["<M-h>"] = { "^", desc = "移动到行首" },
        ["<M-y>"] = { '"+y', desc = "复制文字到系统" },
        ["<M-f>"] = { "<Esc>*", desc = "选中文本在当前的文件搜索" },
      },
      i = {
        ["<M-h>"] = { "<Esc>^i", desc = "移动到行首" },
        ["<M-l>"] = { "<Esc>$a", desc = "移动到行尾" },
        -- 方便写中文
        ["<M-j>"] = { "<Esc>" },
        [""] = { "" }, -- 
      },
      c = {
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
