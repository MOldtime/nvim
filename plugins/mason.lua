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
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NoneLsInstall", "NoneLsUninstall" },
        opts = {
          -- handlers = {},
          handlers = nil,
        },
      },
    },
    event = "User AstroFile",
    opts = {
      on_attach = require("astronvim.utils.lsp").on_attach,
    },
    config = function (_, opts)
      maps {
        n = {
          ["<leader>lI"] = { "<cmd>NullLsInfo<cr>", desc = "Null-ls 信息" },
        },
      }
      opts.on_attach = require("astronvim.utils.lsp").on_attach
      local null_ls = require("null-ls")
      opts.sources = {
        null_ls.builtins.formatting.stylua
      }
      null_ls.setup(opts)
    end
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
