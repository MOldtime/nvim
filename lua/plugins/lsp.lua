return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        cmd = { "lua-language-server", "--locale=zh-cn" },
        settings = {
          Lua = {
            hint = {
              enable = true,
              arrayIndex = "Disable",
            },
            format = {
              enable = true,
              -- Put format options here
              -- NOTE: the value should be String!
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
          },
        },
      },
      clangd = {
        cmd = { "clangd", "--fallback-style=WebKit" },
      },
      oxc_ls = {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
						},
        root_dir = function(fname)
          local param = { path = fname, upward = true }
          return vim.fs.dirname(vim.fs.find("package.json", param)[1])
            or vim.fs.dirname(vim.fs.find("node_modules", param)[1])
            or vim.fs.dirname(vim.fs.find(".git", param)[1])
            or vim.fn.getcwd()
          -- return util.find_package_json_ancestor(fname)
          --   or util.find_node_modules_ancestor(fname)
          --   or util.find_git_ancestor(fname)
          --   or vim.fn.getcwd()
        end,
        single_file_support = true,
        settings = {
          ["enable"] = true,
          ["run"] = "onType",
        },
      },
      kotlin_lsp = {
        cmd = { "kotlin-lsp", "--stdio" },
        single_file_support = true,
        filetypes = { "kotlin" },
        root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
      },
      ts_ls = {
        settings = {
          javascript = {
            referencesCodeLens = {
              enabled = true,
              showOnAllFunctions = true,
            },
          },
        },
      },
    },
  },
}
