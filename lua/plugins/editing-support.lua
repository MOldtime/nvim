local maps = require("astrocore").set_mappings
return {
  -- 对齐插件 ga gA 接 ip
  {
    -- jl lc jr, s= , = ,
    "echasnovski/mini.align",
    lazy = false,
    opts = true,
  },
  -- 快捷跳转
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
    { "<Leader><Leader>", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<Leader>zf", mode = { "n" },
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
  -- 多光标
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
      -- vim.g.VM_quit_after_leaving_insert_mode = 1 -- 退出没有提示
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<C-S-Down>",
        ["Add Cursor Up"] = "<C-S-Up>",
        ["Add Cursor At Pos"] = "<C-;>",
      }
    end,
  },
  -- 增加 修改 删除 字符的周围，例如: (),“”
  {
    -- Old text                    Command         New text-
    -- ---------------------------------------------------------------------------s
    -- urr*ound_words             ysiw)           (surround_words)*
    -- make strings               ys$"            "make strings"[
    -- delete ar*ound me!]        ds]             delete around me!r
    -- emove <b>HTML t*ags</b>    dst             remove HTML tags'
    -- change quot*es'            cs'"            "change quotes"<
    -- b>or tag* types</b>        csth1<CR>       or tag typesd
    -- elete(functi*on calls)     dsf             function calls
    -- 可以修改括住的文本，如：加字符'', 修改括号
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufEnter",
    opts = true,
  },
  -- 直接添加字符在周围
  {
    "NStefan002/visual-surround.nvim",
    event = "BufEnter",
    opts = true,
  },
  -- 加速jk的移动
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
  -- 用于绑定<leader>
  {
    -- https://github.com/max397574/better-escape.nvim
    "max397574/better-escape.nvim",
    opts = function(_, opts)
      opts.mapping = { "jk", "fj" }
      opts.timeout = 200
      return opts
    end,
  },
  -- Cutlass 会覆盖删除操作，实际上只是删除而不影响当前的复制
  {
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
  -- replace
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
          ["<Leader>rs"] = {
            function() vim.api.nvim_command "SearchReplaceSingleBufferSelections" end,
            desc = "SearchReplaceSingleBuffer [s]elction list",
          },
          ["<Leader>ro"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferOpen" end, desc = "[o]pen" },
          ["<Leader>rw"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWord" end, desc = "[w]ord" },
          ["<Leader>rW"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCWORD" end, desc = "[W]ORD" },
          ["<Leader>re"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCExpr" end, desc = "[e]xpr" },
          ["<Leader>rf"] = { function() vim.api.nvim_command "SearchReplaceSingleBufferCFile" end, desc = "[f]ile" },
          ["<Leader>rbs"] = {
            function() vim.api.nvim_command "SearchReplaceMultiBufferSelections" end,
            desc = "SearchReplaceMultiBuffer [s]elction list",
          },
          ["<Leader>rbo"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferOpen" end, desc = "[o]pen" },
          ["<Leader>rbw"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWord" end, desc = "[w]ord" },
          ["<Leader>rbW"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCWORD" end, desc = "[W]ORD" },
          ["<Leader>rbe"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCExpr" end, desc = "[e]xpr" },
          ["<Leader>rbf"] = { function() vim.api.nvim_command "SearchReplaceMultiBufferCFile" end, desc = "[f]ile" },
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
  -- codeium ai
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = true,
    init = function()
      vim.g.codeium_disable_bindings = 1 -- 取消默认的映射
      -- vim.g.codeium_enabled = false -- 默认启用
      -- vim.g.codeium_manual = true -- 取消自动补全
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
  -- 添加标记 快速跳转
  {
    "LeonHeidelbach/trailblazer.nvim",
    event = "BufEnter",
    opts = {
      mappings = {
        nv = {
          motions = {
            new_trail_mark = "<M-;>", -- 新建一个标记
            track_back = "<M-o>", -- 跳转到上一个，并清除
            peek_move_next_down = "<M-j>", -- 跳转到到下一个
            peek_move_previous_up = "<M-k>", -- 跳转到上一个
            move_to_nearest = "<M-n>", -- 跳转到最近
            toggle_trail_mark_list = "<M-m>", -- 显示标记列表
          },
          actions = {
            delete_all_trail_marks = "<leader>md", -- 删除所有标记
            paste_at_last_trail_mark = "<leader>mp", -- 粘贴到最后一个标记
            paste_at_all_trail_marks = "<leader>mP", -- 粘贴到所有的标记
            set_trail_mark_select_mode = "<leader>mt", -- 将轨迹标记选择模式设置为给定模式或在可用模式之间切换
            switch_to_next_trail_mark_stack = "<leader>m.", -- 使用排序模式切换到下一个跟踪标记堆栈
            switch_to_previous_trail_mark_stack = "<leader>m,", -- 使用排序模式切换到上一个跟踪标记堆栈
            set_trail_mark_stack_sort_mode = "<leader>ms", -- 将跟踪标记堆栈排序模式设置为给定模式或在可用模式之间切换
          },
        },
      },
    },
  },
  -- 扩展 C-a, C-x, 切换true -> false...
  {
    "nat-418/boole.nvim",
    event = "BufEnter",
    opts = {
      mappings = {
        increment = "<C-a>",
        decrement = "<C-x>",
      },
      -- User defined loops
      additions = {
        { "Foo", "Bar" },
        { "tic", "tac", "toe" },
      },
      allow_caps_additions = {
        { "enable", "disable" },
        -- enable → disable
        -- Enable → Disable
        -- ENABLE → DISABLE
      },
    },
  },
  --自动补齐符号
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
