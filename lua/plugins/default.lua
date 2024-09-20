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

---@type LazySpec
return {
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
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_default",
      },
    },
  },
}
