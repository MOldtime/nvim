-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- 需要安装的lsp
      -- 查看语言支持列表：https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
      -- 复看对应的名子：https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "clangd",
        "jsonls",
        "pylsp",
        "kotlin_language_server",
        -- "java_language_server",
        "rust_analyzer",
        "tsserver",
        "yamlls",
        "lemminx",
        "vimls", -- vim language server
        "taplo", -- Toml
        "sqlls", -- sql language server
        "html", -- html language server
        "cssls", -- css language server
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        -- "stylua",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
      })
    end,
  },
}
