local maps = require("astrocore").set_mappings
local tools = require "tools.utils"
local is_available = require("astrocore").is_available

-- 简单修改
if is_available "telescope.nvim" then
  local builtin = require "telescope.builtin"
  maps {
    v = {
      ["<leader>fw"] = {
        function() builtin.grep_string { search = tools.Gets_selected_text() } end,
        desc = "Find Selected Content",
      },
      ["<leader>f/"] = {
        function() builtin.current_buffer_fuzzy_find { default_text = tools.Gets_selected_text() } end,
        desc = "Find words in current buffer",
      },
    },
  }
end
return {
  -- {
  --   "rebelot/heirline.nvim",
  --   dependencies = { "SmiteshP/nvim-navic" },
  --   opts = function(_, opts)
  --     local utils = require "astroui"
  --     local status = require "astroui.status"
  --     local get_icon = utils.get_icon
  --
  --     local FileEncoding = status.component.builder {
  --       {
  --         provider = function() return (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc end,
  --         hl = require("astroui.status.hl").get_attributes "git_branch",
  --         condition = function() return (((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc) ~= "utf-8") end,
  --         on_click = {
  --           name = "SetFileEncoding",
  --           callback = function() require("user.tools.utils").SetFileEncoding() end,
  --         },
  --       },
  --     }
  --
  --     local mode = status.component.builder {
  --       status.component.builder {
  --         provider = get_icon "VimIcon",
  --         surround = {
  --           separator = "mode_left",
  --           color = function() return { main = status.hl.mode_bg() } end,
  --         },
  --         hl = status.hl.get_attributes "mode",
  --       },
  --       status.component.mode {
  --         mode_text = { padding = { left = 1 } },
  --         surround = { separator = "none" },
  --       },
  --       status.component.builder {
  --         provider = function()
  --           local recording_register = vim.fn.reg_recording()
  --           if recording_register == "" then
  --             return ""
  --           else
  --             return " | " .. recording_register
  --           end
  --         end,
  --         surround = {
  --           separator = "mode_right",
  --           color = function() return { main = status.hl.mode_bg() } end,
  --         },
  --         hl = status.hl.get_attributes "mode",
  --       },
  --     }
  --
  --     -- 简单修改
  --     local codeium = status.component.builder() -- 没有就为空
  --     if is_available "codeium.vim" then
  --       codeium = status.component.builder {
  --         {
  --           provider = function()
  --             local model = vim.fn["codeium#GetStatusString"]()
  --             local text = "  "
  --             if model == " ON" then
  --               text = text .. "ON"
  --             elseif model == " 0 " then
  --               text = text .. " 0"
  --             elseif model == " * " then
  --               text = text .. " *"
  --             elseif model == "OFF" then
  --               text = text .. "OFF"
  --             elseif model == "   " then
  --               text = text .. " "
  --             else
  --               text = text .. " " .. model
  --             end
  --             return text
  --           end,
  --           hl = status.hl.get_attributes "treesitter",
  --         },
  --       }
  --     end
  --     opts.winbar = nil
  --     opts.statusline = {
  --       hl = { fg = "fg", bg = "bg" },
  --       mode,
  --       status.component.git_branch { surround = { separator = "interval_left" }, hl = false },
  --       FileEncoding,
  --       status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
  --       status.component.fill(),
  --       status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
  --       status.component.fill(),
  --       status.component.diagnostics { surround = false, padding = { right = 2 } },
  --       status.component.lsp { lsp_progress = false, surround = false },
  --       status.component.treesitter(),
  --       codeium,
  --       {
  --         status.component.builder {
  --           { provider = utils.get_icon "FolderClosed" },
  --           padding = { right = 1 },
  --           hl = { fg = "bg" },
  --           surround = { separator = "right", color = "folder_icon_bg" },
  --         },
  --         status.component.file_info {
  --           filename = { fname = function(nr) return vim.fn.getcwd(nr) end, padding = { left = 1 } },
  --           file_icon = false,
  --           file_modified = false,
  --           file_read_only = false,
  --           surround = { separator = "none", color = "file_info_bg", condition = false },
  --         },
  --       },
  --       { -- make nav section with icon border
  --         status.component.builder {
  --           { provider = utils.get_icon "ScrollText" },
  --           padding = { right = 1 },
  --           hl = { fg = "bg" },
  --           surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
  --         },
  --         status.component.nav {
  --           percentage = { padding = { right = 1 } },
  --           ruler = { padding = { left = 1 } },
  --           scrollbar = false,
  --           surround = { separator = "nav", color = "file_info_bg" },
  --         },
  --       },
  --     }
  --
  --     opts.tabline = { -- bufferline
  --       { -- file tree padding
  --         condition = function(self)
  --           self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
  --           return status.condition.buffer_matches({
  --             filetype = {
  --               "NvimTree",
  --               "OverseerList",
  --               "aerial",
  --               "dap%-repl",
  --               "dapui_.",
  --               "edgy",
  --               "neo%-tree",
  --               "undotree",
  --             },
  --           }, vim.api.nvim_win_get_buf(self.winid))
  --         end,
  --         provider = function(self) return string.rep(" ", vim.api.nvim_win_get_width(self.winid) + 1) end,
  --         hl = { bg = "tabline_bg" },
  --       },
  --       status.heirline.make_buflist(status.component.tabline_file_info()), -- component for each buffer tab
  --       status.component.fill { hl = { bg = "tabline_bg" } }, -- fill the rest of the tabline with background color
  --       { -- tab list
  --         condition = function() return #vim.api.nvim_list_tabpages() >= 2 end, -- only show tabs if there are more than one
  --         status.heirline.make_tablist { -- component for each tab
  --           provider = status.provider.tabnr(),
  --           hl = function(self) return status.hl.get_attributes(status.heirline.tab_type(self, "tab"), true) end,
  --         },
  --         { -- close button for current tab
  --           provider = status.provider.close_button { kind = "TabClose", padding = { left = 1, right = 1 } },
  --           hl = status.hl.get_attributes("tab_close", true),
  --           on_click = {
  --             callback = function() require("astronvim.utils.buffer").close_tab() end,
  --             name = "heirline_tabline_close_tab_callback",
  --           },
  --         },
  --       },
  --     }
  --     return opts
  --   end,
  -- },
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
      -- local utils = require "user.tools.utils"
      opts.textobjects.select.keymaps["ad"] = opts.textobjects.select.keymaps["a?"]
      opts.textobjects.select.keymaps["id"] = opts.textobjects.select.keymaps["i?"]
      opts.textobjects.select.keymaps["a?"] = nil
      opts.textobjects.select.keymaps["i?"] = nil
      -- 翻译
      require("nvim-treesitter.configs").setup(opts)
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
      if vim.loop.os_uname().sysname == "Windows_NT" then
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
      end

      -- set mappings
      maps {
        t = {
          ["fj"] = {
            [[<C-\><C-n>]],
          },
        },
      }
      require("toggleterm").setup(opts)
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_default",
      },
    },
  },
}
