-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = {
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        clipboard = "",
        expandtab = true,
        list = true,
        termguicolors = true, -- 开启真彩色
        listchars = {
          tab = "---",
        },
        inccommand = "split", -- 在实时预览窗口中显示搜索/替换的效果
        cmdheight = 1,
        smartindent = true,
        guicursor = "n-v-c-sm:block,r-cr-o:hor20,i-ci-ve:ver20-blinkwait250-blinkoff700-blinkon700",
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
      [""] = {
        ["<Leader>`"] = { "~", desc = "把小写转换为大写" },
        ["<M-p>"] = { "<middlemouse>", desc = "粘贴系统剪切板" },
        ["<Leader>zr"] = { function() vim.api.nvim_command "e!" end, desc = "重新加载文件" },
      },
      ["!"] = {
        ["<M-p>"] = { "<middlemouse>", desc = "粘贴系统剪切板" },
      },
      n = {
        ["<M-p>"] = { '"+p', desc = "输入时粘贴系统剪切板" },
        ["<tab>"] = { "v>", desc = "缩进" },
        ["<s-tab>"] = { "v<", desc = "缩进" },
        ["<M-h>"] = { "^", desc = "移动到行首" },
        ["<M-l>"] = { "$", desc = "移动到行尾" },
        ["<M-J>"] = {
          function()
            if vim.api.nvim_win_get_cursor(0)[1] < vim.api.nvim_buf_line_count(0) then vim.api.nvim_command "m +1" end
          end,
          desc = "选择当前向下移动",
        },
        ["<M-K>"] = {
          function()
            if vim.api.nvim_win_get_cursor(0)[1] > 1 then vim.api.nvim_command "m -2" end
          end,
          desc = "选择当前向上移动",
        },
        -- ["<leader>zt"] = {
        --   function() utils.SetFileType() end,
        --   desc = "设置文件类型",
        -- },
        -- ["<leader>ze"] = {
        --   function() utils.SetFileEncoding() end,
        --   desc = "设置文件编码",
        -- },
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
        -- ["<M-J>"] = {
        --   function()
        --     tool.LazyConmand(function()
        --       local start_pos = vim.fn.getpos "'<"
        --       local end_pos = vim.fn.getpos "'>"
        --       local end_line = end_pos[2]
        --       if end_line < vim.api.nvim_buf_line_count(0) then
        --         vim.api.nvim_command(start_pos[2] .. "," .. end_line .. "m" .. end_line + 1)
        --       end
        --       vim.api.nvim_input "gv"
        --     end)
        --   end,
        --   desc = "选择当前向下移动",
        -- },
        -- ["<M-K>"] = {
        --   function()
        --     tool.LazyConmand(function()
        --       local start_pos = vim.fn.getpos "'<"
        --       local end_pos = vim.fn.getpos "'>"
        --       local start_line = start_pos[2]
        --       if start_line > 1 then vim.api.nvim_command(start_line .. "," .. end_pos[2] .. "m" .. start_line - 2) end
        --       vim.api.nvim_input "gv"
        --     end)
        --   end,
        --   desc = "选择当前向上移动",
        -- },
        ["<M-l>"] = { "$", desc = "移动到行尾" },
        ["<M-h>"] = { "^", desc = "移动到行首" },
        ["<M-y>"] = { '"+y', desc = "复制文字到系统" },
        ["<M-f>"] = { "<Esc>*", desc = "选中文本在当前的文件搜索" },
      },
      i = {
        ["<M-h>"] = { "<Esc>^i", desc = "移动到行首" },
        ["<M-l>"] = { "<Esc>$a", desc = "移动到行尾" },
        ["<M-CR>"] = { "<Esc>o", desc = "下一行" },
        -- ["<M-f>"] = { "%" },
        -- ["<M-j>"] = { "^" },
        -- 方便写中文
        ["<M-j>"] = { "<Esc>" },
        [""] = { "" },
      },
      c = {
        ["<M-l>"] = {
          "<Right>",
        },
        ["<M-h>"] = {
          "<Left>",
        },
      },
      t = {
        ["<M-p>"] = { "<middlemouse>a", desc = "粘贴系统剪切板" },
      },
    },
  },
}
