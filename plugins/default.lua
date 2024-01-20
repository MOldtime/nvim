return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- enabled = false,
    opts = { scope = { enabled = false } },
  },
  {
    "rebelot/heirline.nvim",
    dependencies = { "SmiteshP/nvim-navic" },
    opts = function(_, opts)
      local utils = require "astronvim.utils"
      local status = require "astronvim.utils.status"
      local get_icon = utils.get_icon

      -- 输入一个颜色，返回一个新的颜色
      --- @param hex_color string 颜色，16进制
      --- @param transparency number 透明度，小于1
      local lighten_color = function(hex_color, transparency)
        local r = tonumber(string.sub(hex_color, 2, 3), 16)
        local g = tonumber(string.sub(hex_color, 4, 5), 16)
        local b = tonumber(string.sub(hex_color, 6, 7), 16)

        -- 计算新的RGB值
        r = math.floor(r * transparency)
        g = math.floor(g * transparency)
        b = math.floor(b * transparency)

        -- 将RGB值转换为16进制颜色字符串
        return string.format("#%02x%02x%02x", r, g, b)
      end

      local mode_color = function() return lighten_color(status.hl.lualine_mode(status.hl.mode_bg(), "#ffffff"), 0.65) end
      local mode_text_color = function()
        return lighten_color(status.hl.lualine_mode(status.hl.mode_bg(), "#ffffff"), 0.2)
      end

      local mode_icon = function()
        local mode_text = status.env.modes[vim.fn.mode()][1]
        local get_mode = vim.fn.mode()
        local mode = get_mode:lower()
        local icon
        if mode == "n" then icon = " " end
        if mode == "i" or mode == "t" then icon = "ﲅ " end
        if mode == "v" or mode == "�" then icon = " " end
        if mode == "r" then icon = " " end
        if mode == "c" then icon = " " end
        if icon == nil then icon = get_icon "VimIcon" .. " " end
        return " " .. icon .. mode_text .. " "
      end

      -- Displays Macros
      local show_macro_recording = function()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
          return " "
        else
          return "壘" .. recording_register .. " "
        end
      end

      local FileEncoding = status.component.builder {
        {
          provider = function() return (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc end,
          hl = require("astronvim.utils.status.hl").get_attributes "git_branch",
          condition = function() return (((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc) ~= "utf-8") end,
          on_click = {
            name = "SetFileEncoding",
            callback = function() require("user.tools.utils").SetFileEncoding() end,
          },
        },
      }

      opts.winbar = nil
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.builder {
          { provider = function() return mode_icon() end },
          hl = { fg = "bg" },
          surround = {
            separator = "left",
            color = function() return { main = status.hl.mode_bg(), right = mode_color() } end,
          },
        },
        status.component.builder {
          { provider = show_macro_recording },
          hl = function() return { fg = mode_text_color(), bold = true } end,
          surround = {
            separator = "left",
            color = function() return { main = mode_color(), right = "file_info_bg" } end,
          },
        },
        status.component.builder {
          { provider = "" },
          surround = { separator = "left", color = { main = "file_info_bg", right = "bg" } },
        },
        status.component.git_branch { surround = { separator = "none" } },
        FileEncoding,
        status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
        status.component.fill(),
        status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
        status.component.fill(),
        status.component.diagnostics { surround = false, padding = { right = 2 } },
        status.component.lsp { lsp_progress = false, surround = false },
        status.component.treesitter(),
        {
          status.component.builder {
            { provider = utils.get_icon "FolderClosed" },
            padding = { right = 1 },
            hl = { fg = "bg" },
            surround = { separator = "right", color = "folder_icon_bg" },
          },
          status.component.file_info {
            filename = { fname = function(nr) return vim.fn.getcwd(nr) end, padding = { left = 1 } },
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            surround = { separator = "none", color = "file_info_bg", condition = false },
          },
        },
        { -- make nav section with icon border
          status.component.builder {
            { provider = utils.get_icon "ScrollText" },
            padding = { right = 1 },
            hl = { fg = "bg" },
            surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
          },
          status.component.nav {
            percentage = { padding = { right = 1 } },
            ruler = { padding = { left = 1 } },
            scrollbar = false,
            surround = { separator = "none", color = "file_info_bg" },
          },
        },
      }
      return opts
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        use_libuv_file_watcher = false, -- 不开的原因是 Windows 下有Bug;
        -- hijack_netrw_behavior = "open_default",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        presets = {
          text_objects = false,
          nav = false,
          windows = false,
          z = false,
          g = false,
        },
      },
    },
    config = function(_, opts)
      require("user.config.translation").whichkey(opts)
      require("which-key").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local utils = require "user.tools.utils"
      -- 这里可以理解为要安装的语言
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "c",
        "cpp",
        "rust",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "kotlin",
        "typescript",
        "css",
        "yaml",
        "toml",
        "xml",
        "json",
        "json5",
        "markdown",
        "markdown_inline",
        "bash",
        "regex",
      })
      -- local value = opts.textobjects.select.keymaps
      opts.textobjects.select.keymaps["ad"] = opts.textobjects.select.keymaps["a?"]
      opts.textobjects.select.keymaps["id"] = opts.textobjects.select.keymaps["i?"]

      opts.textobjects.select.keymaps["a?"] = nil
      opts.textobjects.select.keymaps["i?"] = nil
      -- 翻译
      utils.Assignment(opts.textobjects.move.goto_next_start, "]k", "下一个区块开始")
      utils.Assignment(opts.textobjects.move.goto_next_start, "]f", "下一个函数开始")
      utils.Assignment(opts.textobjects.move.goto_next_start, "]a", "下一个参数开始")
      utils.Assignment(opts.textobjects.move.goto_next_end, "]K", "下一个块结束")
      utils.Assignment(opts.textobjects.move.goto_next_end, "]F", "下一个函数结束")
      utils.Assignment(opts.textobjects.move.goto_next_end, "]A", "下一个参数结束")
      utils.Assignment(opts.textobjects.move.goto_previous_start, "[k", "上一个块开始")
      utils.Assignment(opts.textobjects.move.goto_previous_start, "[f", "上一个函数开始")
      utils.Assignment(opts.textobjects.move.goto_previous_start, "[a", "上一个参数开始")
      utils.Assignment(opts.textobjects.move.goto_previous_end, "[K", "上一个块结束")
      utils.Assignment(opts.textobjects.move.goto_previous_end, "[F", "上一个函数结束")
      utils.Assignment(opts.textobjects.move.goto_previous_end, "[A", "上一个参数结束")
      -- -----------
      utils.Assignment(opts.textobjects.swap.swap_next, ">K", "交换下一个块")
      utils.Assignment(opts.textobjects.swap.swap_next, ">F", "交换下一个函数")
      utils.Assignment(opts.textobjects.swap.swap_next, ">A", "交换下一个参数")
      utils.Assignment(opts.textobjects.swap.swap_previous, "<K", "交换上一个块")
      utils.Assignment(opts.textobjects.swap.swap_previous, "<F", "交换上一个函数")
      utils.Assignment(opts.textobjects.swap.swap_previous, "<A", "交换前一个参数")
      -- -----------
      utils.Assignment(opts.textobjects.select.keymaps, "ak", "块")
      utils.Assignment(opts.textobjects.select.keymaps, "ik", "块")
      utils.Assignment(opts.textobjects.select.keymaps, "ac", "类")
      utils.Assignment(opts.textobjects.select.keymaps, "ic", "类")
      utils.Assignment(opts.textobjects.select.keymaps, "ad", "条件")
      utils.Assignment(opts.textobjects.select.keymaps, "id", "条件")
      utils.Assignment(opts.textobjects.select.keymaps, "af", "函数")
      utils.Assignment(opts.textobjects.select.keymaps, "if", "函数")
      utils.Assignment(opts.textobjects.select.keymaps, "al", "循环")
      utils.Assignment(opts.textobjects.select.keymaps, "il", "循环")
      utils.Assignment(opts.textobjects.select.keymaps, "aa", "参数")
      utils.Assignment(opts.textobjects.select.keymaps, "ia", "参数")

      -- 使用回车或返回选择范围
      local incremental_selection_keymaps = {
        init_selection = "gnn", -- set to `false` to disable one of the mappings
        node_incremental = "<CR>",
        -- scope_incremental = "grc",
        node_decremental = "<BS>",
      }
      opts.incremental_selection.keymaps = incremental_selection_keymaps

      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astronvim.utils").list_insert_unique(
          opts.ensure_installed,
          { "bash", "markdown", "markdown_inline", "regex", "vim" }
        )
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, config)
      config.sources = {}
      return config -- return final config table
    end,
  },
}
