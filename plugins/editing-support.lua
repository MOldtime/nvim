local maps = require("astronvim.utils").set_mappings
return {
  {
    -- 对齐插件 ga gA 接 ip
    -- jl lc jr, s= , = ,
    "echasnovski/mini.align",
    lazy = false,
    opts = true,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
      -- jump = {
      --   autojump = false, -- 当唯一个的时候自动跳转
      -- },
      label = {
        -- 大写标签
        uppercase = false,
      },
    },
  -- stylua: ignore
  keys = {
    { "<leader><leader>", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<leader>zf", mode = { "n" },
        function()
          local Flash = require("flash")

          -- @param opts Flash.Format
          local function format(opts)
            -- always show first and second label
            return {
              { opts.match.label1, "FlashMatch" },
              { opts.match.label2, "FlashLabel" },
            }
          end

          Flash.jump({
            search = { mode = "search" },
            label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
            pattern = [[\<]],
            action = function(match, state)
              state:hide()
              Flash.jump({
                search = { max_length = 0 },
                highlight = { matches = false },
                label = { format = format },
                matcher = function(win)
                  -- limit matches to the current label
                  return vim.tbl_filter(function(m)
                    return m.label == match.label and m.win == win
                  end, state.results)
                end,
                labeler = function(matches)
                  for _, m in ipairs(matches) do
                    m.label = m.label2  -- use the second label
                  end
                end,
              })
            end,
            labeler = function(matches, state)
              local labels = state:labels()
              for m, match in ipairs(matches) do
                match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                match.label2 = labels[(m - 1) % #labels + 1]
                match.label = match.label1
              end
            end,
          })
        end,
        desc = "Flash 中文专用"
      },
  },
  },
  {
    -- 基本用法:
    --    选择单词Ctrl-N（如Ctrl-dSublime Text/VS Code 中）
    --    Alt + j,k 设置垂直或向上光标
    --    一次选择一个字符Shift-Arrows
    --    按n/N获取下一个/上一个出现的情况
    --    按[/]选择下一个/上一个光标
    --    按此键q可跳过当前内容并获取下一个出现的内容
    --    按下Q可删除当前光标/选择
    --    使用i, a, I,启动插入模式A
    --    多光标选择
    "mg979/vim-visual-multi",
    event = "BufEnter",
    init = function()
      vim.g.VM_quit_after_leaving_insert_mode = 1 -- 退出没有提示
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<C-j>",
        ["Add Cursor Up"] = "<C-k>",
      }
    end,
  },
  {
    -- Old text                    Command         New text-
    -- ---------------------------------------------------------------------------s
    -- urr*ound_words             ysiw)           (surround_words)*
    -- make strings               ys$"            "make strings"[
    -- delete ar*ound me!]        ds]             delete around me!r
    -- emove <b>HTML t*ags</b>    dst             remove HTML tags'
    -- change quot*es'            cs'"            "change quotes"<
    -- b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>d
    -- elete(functi*on calls)     dsf             function calls
    -- 可以修改括住的文本，如：加字符'', 修改括号
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  {
    -- https://github.com/rainbowhxch/accelerated-jk.nvim
    "rainbowhxch/accelerated-jk.nvim",
    event = { "User AstroFile" },
    opts = {
      -- acceleration_table = { 7,12,17,21,24,26,28,30 }
    },
    config = function()
      maps {
        n = {
          j = {
            "<Plug>(accelerated_jk_gj)",
            desc = "向下移动",
          },
          k = {
            "<Plug>(accelerated_jk_gk)",
            desc = "向上移动",
          },
        },
      }
    end,
  },
  {
    -- https://github.com/max397574/better-escape.nvim
    -- 用于绑定<leader>
    "max397574/better-escape.nvim",
    opts = function(_, opts)
      opts.mapping = { "jk", "fj" }
      opts.timeout = 200
      return opts
    end,
  },
  {
    -- Cutlass 会覆盖删除操作，实际上只是删除而不影响当前的复制
    "gbprod/cutlass.nvim",
    event = { "User AstroFile" },
    opts = {
      cut_key = "m",
      override_del = nil,
      exclude = { "nx" },
      registers = {
        select = "_",
        delete = "_",
        change = "_",
      },
    },
  },
  {
    "roobert/search-replace.nvim",
    event = "BufEnter",
    opts = {
      default_replace_single_buffer_options = "gcI",
      default_replace_multi_buffer_options = "egcI",
    },
    config = function(_, opts)
      maps {
        n = {
          ["<leader>rs"] = {
            function() vim.api.nvim_command "SearchReplaceSingleBufferSelections" end,
            desc = "SearchReplaceSingleBuffer [s]elction list",
          },
          ["<leader>ro"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferOpen" end, desc = "[o]pen" },
          ["<leader>rw"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWord" end, desc = "[w]ord" },
          ["<leader>rW"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWORD" end, desc = "[W]ORD" },
          ["<leader>re"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCExpr" end, desc = "[e]xpr" },
          ["<leader>rf"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCFile" end, desc = "[f]ile" },
          ["<leader>rbs"] = {
            function() vim.api.nvim_command "SearchReplaceMultiBufferSelections" end,
            desc = "SearchReplaceMultiBuffer [s]elction list",
          },
          ["<leader>rbo"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferOpen" end, desc = "[o]pen" },
          ["<leader>rbw"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWord" end, desc = "[w]ord" },
          ["<leader>rbW"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWORD" end, desc = "[W]ORD" },
          ["<leader>rbe"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCExpr" end, desc = "[e]xpr" },
          ["<leader>rbf"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCFile" end, desc = "[f]ile" },
        },
        v = {
          ["<C-r>"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferVisualSelection" end },
          ["<C-s>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelection" end },
          ["<C-b>"] = { function() vim.api.nvim_command "SearchReplaceWithinVisualSelectionCWord" end },
        },
      }
      require("search-replace").setup(opts)
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    init = function()
      vim.g.codeium_disable_bindings = 1 -- 取消默认的映射
      vim.g.codeium_enabled = true -- 默认启用
      vim.g.codeium_manual = true -- 取消自动补全
    end,
    config = function()
      maps {
        i = {
          ["<M-CR>"] = {
            function() return vim.fn["codeium#Accept"]() end, -- 插入建议
            expr = true,
            silent = true,
          },
          ["<M-;>"] = {
            function() vim.fn["codeium#CycleCompletions"](1) end, -- 下一个
          },
          ["<M-'>"] = {
            function() vim.fn["codeium#CycleCompletions"](-1) end, -- 上一个
          },
          ["<M-BS>"] = {
            function() vim.fn["codeium#Clear"]() end, -- 清除
          },
          ["<C-Tab>"] = {
            function() vim.fn["codeium#Complete"]() end, -- 手动触发
          },
        },
        n = {
          ["<M-F2>"] = {
            function()
              vim.g.codeium_enabled = not vim.g.codeium_enabled
              vim.notify(vim.g.codeium_enabled and "Codeium已开启" or "Codeium已关闭")
            end,
            desc = "切换codeium",
          },
        },
      }
    end,
  },
}
