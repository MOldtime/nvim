local maps = require("astronvim.utils").set_mappings
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

      local mode = status.component.builder {
        status.component.builder {
          provider = get_icon "VimIcon",
          surround = {
            separator = "mode_left",
            color = function() return { main = status.hl.mode_bg() } end,
          },
          hl = status.hl.get_attributes "mode",
        },
        status.component.mode {
          mode_text = { padding = { left = 1 } },
          surround = { separator = "none" },
        },
        status.component.builder {
          provider = function()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
              return ""
            else
              return " | " .. recording_register
            end
          end,
          surround = {
            separator = "mode_right",
            color = function() return { main = status.hl.mode_bg() } end,
          },
          hl = status.hl.get_attributes "mode",
        },
      }

      opts.winbar = nil
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        mode,
        status.component.git_branch { surround = { separator = "interval_left" }, hl = false },
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
            surround = { separator = "nav", color = "file_info_bg" },
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
        use_libuv_file_watcher = false, -- Windows delete bug;
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
    opts = {
      incremental_selection = {
        -- 使用回车或退格选择范围
        keymaps = {
          init_selection = "gnn",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },
      ensure_installed = {
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
      },
    },
    config = function(_, opts)
      local utils = require "user.tools.utils"
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
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function(_, opts)
      opts.sources = {}
      require("null-ls").setup(opts)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      insert_mappings = true,
      terminal_mappings = true,
    },
    config = function(_, opts)
      local powershell_options = {
        shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
        shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
        shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
        shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
        shellquote = "",
        shellxquote = "",
      }

      for option, value in pairs(powershell_options) do
        vim.opt[option] = value
      end

      -- set mappings
      maps {
        t = {
          ["<Esc>"] = {
            [[<C-\><C-n>]],
          },
          ["fj"] = {
            [[<C-\><C-n>]],
          },
        },
      }
      require("toggleterm").setup(opts)
    end,
  },
  { "AstroNvim/astrotheme", enabled = false },
}
