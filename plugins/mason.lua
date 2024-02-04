local maps = require("astronvim.utils").set_mappings
return {
  -- {
  --   "williamboman/mason.nvim",
  --   config = function(_, opts)
  --     opts.log_level = vim.log.levels.DEBUG
  --     require("mason").setup(opts)
  --   end,
  -- },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "clangd",
        "jsonls",
        "pylsp",
        "kotlin_language_server",
        "rust_analyzer",
        "tsserver",
        "yamlls",
        "lemminx",
        "vimls", -- vim language server
        "taplo", -- Toml
        "sqlls", -- sql language server
        "html", -- html language server
        "cssls", -- css language server
        "volar",
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "User AstroFile",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        opts = { handlers = {} },
      },
    },
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "stylua",
      })
      -- opts.debug = true
      opts.on_attach = require("astronvim.utils.lsp").on_attach
      maps {
        n = {
          ["<leader>lI"] = { "<cmd>NullLsInfo<cr>", desc = "Null-ls 信息" },
        },
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}
