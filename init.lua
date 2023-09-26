return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
          "markdown",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
      "ahk",
    },
    ["server-settings"] = {
      -- config = {
      ahk = {
        -- autostart = true,
        cmd = {
          "node",
          "C:/File_Data/Language Server Protocol/Autohotkey/server/dist/server.js",
          -- "thqby.vscode-autohotkey2-lsp v2.1.8/server/dist/server.js",
          "--stdio",
        },
        filetypes = { "autohotkey", "ahk" },
        -- init_options = {
        --   locale = "zh-cn",
        --   AutoLibInclude = "Disabled",
        --   CommentTags = "^;;\\s*(?<tag>.+)",
        --   CompleteFunctionParens = false,
        --   Diagnostics = {
        --     ClassStaticMemberCheck = true,
        --     ParamsCheck = true,
        --   },
        --   DisableV1Script = true,
        --   FormatOptions = {
        --     break_chained_methods = false,
        --     ignore_comment = false,
        --     indent_string = "\t",
        --     keep_array_indentation = true,
        --     max_preserve_newlines = 2,
        --     one_true_brace = "1",
        --     preserve_newlines = true,
        --     space_before_conditional = true,
        --     space_in_empty_paren = false,
        --     space_in_other = true,
        --     space_in_paren = false,
        --     wrap_line_length = 0,
        --   },
        --   InterpreterPath = "C:/Program Files/Autohotkey/v2/AutoHotkey.exe",
        --   SymbolFoldingFromOpenBrace = false,
        -- },
        -- single_file_support = true,
        -- flags = { debounce_text_changes = 500 },
        -- capabilities = function(client, bufnr)
        --   lsp_signature.on_attach {
        --     bind = true,
        --     use_lspsaga = false,
        --     floating_window = true,
        --     fix_pos = true,
        --     hint_enable = true,
        --     hi_parameter = "Search",
        --     handler_opts = { "double" },
        --   }
        -- end,
      },
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    require "user.config.global"
    -- require "heirline"
    -- require "user.plugins.dap"
  end,
  -- icons = require "user.icons",
  -- heirline = require "user.heirline.heirline",
  -- plugins = {
  --   require "user.config.heirline",
  -- },
  --
  --
  -- return {
  -- add new user interface icon
  -- }
}
