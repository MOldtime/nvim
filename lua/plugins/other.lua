local maps = require("astrocore").set_mappings
-- return {}
return {
  {
    "iamcco/markdown-preview.nvim",
    edable = false,
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    dependencies = {
      {
        "TobinPalmer/pastify.nvim",
        cmd = { "Pastify" },
        event = {
          "BufReadPre *.md",   -- markdown
          "BufReadPre *.html", -- html
          -- "BufReadPre *.html", -- tex
        },
        config = function()
          maps {
            n = {
              ["<leader>zp"] = {
                function() vim.api.nvim_command "Pastify" end,
                desc = "粘贴图片文件",
              },
            },
          }
        end,
      },
    },
    event = "BufReadPre *.md", -- markdown
    -- build = "cd app && npm install",
    -- build = function() vim.fn["mkdp#util#install"]() end,
    init = function() vim.g.mkdp_theme = "dark" end,
  },
  {
    "Mythos-404/xmake.nvim",
    event = "BufReadPost xmake.lua",
    version = "^3",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      on_save = {
        lsp_compile_commands = {
          enable = true,
          -- Directory name (relative path) for output file
          output_dir = "build",
        },
      },
      lsp = {
        enable = true,
        language = "zh-cn",
      },
    },
  },
  -- cpp tools 用于实现函数
  {
    "Badhi/nvim-treesitter-cpp-tools",
    event = {
      "BufReadPre *.h",
      "BufNewFile *.h",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- Optional: Configuration
    opts = function()
      local options = {
        preview = {
          quit = "q",                             -- optional keymapping for quit preview
          accept = "<tab>",                       -- optional keymapping for accept preview
        },
        header_extension = "h",                   -- optional
        source_extension = "cpp",                 -- optional
        custom_define_class_function_commands = { -- optional
          TSCppImplWrite = {
            output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
          },
          --[[
                <your impl function custom command name> = {
                    output_handle = function (str, context)
                        -- string contains the class implementation
                        -- do whatever you want to do with it
                    end
                }
                ]]
        },
      }
      return options
    end,
    -- End configuration
    config = true,
  },

  {
    "nvimtools/hydra.nvim",
    config = function()
      -- create hydras in here
    end,
  },

  -- cmake tools
  {
    "Civitasv/cmake-tools.nvim",
    event = "BufReadPost CMakeLists.txt",
    opts = {
      cmake_compile_commands_from_lsp = true,
      cmake_soft_link_compile_commands = false,
    },
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    event = "VeryLazy",
    opts = {
      has_breadcrumbs = true, -- show path
      has_line_number = true, -- show line
      bg_color = "#535c68",   -- background color"
      bg_x_padding = 50,
      bg_y_padding = 20,
      watermark = "",
    },
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    lazy = false
  },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  }
}
