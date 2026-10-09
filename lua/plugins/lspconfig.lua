return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Disable a keymap
          { "<a-p>", false },
          { "<a-n>", false },
        },
      },
      gopls = {
        settings = {
          usePlaceholders = false,
          hints = {
            parameterNames = false,
            compositeLiteralTypes = false,
          },
        },
      },
    },
  },
}
