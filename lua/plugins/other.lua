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
          "BufReadPre *.md", -- markdown
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
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      compile_command = { -- compile_command 文件生成配置
        lsp = "clangd", -- 生成供哪个 lsp 读取的 compile_commands 文件
        dir = "build", -- 生成的的位置
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
          quit = "q", -- optional keymapping for quit preview
          accept = "<tab>", -- optional keymapping for accept preview
        },
        header_extension = "h", -- optional
        source_extension = "cpp", -- optional
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
}
