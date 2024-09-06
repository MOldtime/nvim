local maps = require("astrocore").set_mappings
local utils = require "tools.utils"
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

            --- @class Flash.Match
            --- @field label2 string
            --- @field label1 string
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
    enabled = vim.loop.os_uname().sysname == "Windows_NT" and true or false,
    event = { "User AstroFile" },
    opts = {
      acceleration_table = { 5, 14, 19, 23, 26, 28, 30, 32 },
    },
    config = function()
      maps {
        n = {
          j = {
            "<Plug>(accelerated_jk_j)",
            desc = "向下移动",
          },
          k = {
            "<Plug>(accelerated_jk_k)",
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
    opts = {
      timeout = 200,
      default_mappings = false,
      mappings = {
        i = { j = { k = "<Esc>", j = "<Esc>" }, f = { j = "<Esc>" } },
      },
    },
  },
  -- Cutlass 会覆盖删除操作，实际上只是删除而不影响当前的复制
  {
    "gbprod/cutlass.nvim",
    lazy = false, -- 使其在whick-key之前加载
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
          ["<Leader>rb"] = {
            function() vim.api.nvim_command "SearchReplaceMultiBufferSelections" end,
            desc = "SearchReplaceMultiBuffer [s]elction list",
          },
        },
        v = {
          ["<C-r>"] = {
            function() vim.api.nvim_command "SearchReplaceSingleBufferVisualSelection" end,
            desc = "选中搜索替换",
          },
        },
      }
      require("search-replace").setup(opts)
    end,
  },
  -- fittencode ai
  {
    "luozhiya/fittencode.nvim",
    opts = {
      use_default_keymaps = true,
      keymaps = {
        inline = {
          ["<M-CR>"] = "accept_all_suggestions",
          ["<M-'>"] = "accept_line",
          ["<M-;>"] = "accept_word",
          ["<C-Tab>"] = "triggering_completion",
        },
        chat = {
          -- ["q"] = "close",
          -- ["[c"] = "goto_previous_conversation",
          -- ["]c"] = "goto_next_conversation",
          -- ["c"] = "copy_conversation",
          -- ["C"] = "copy_all_conversations",
          -- ["d"] = "delete_conversation",
          -- ["D"] = "delete_all_conversations",
        },
      },
    },
    config = function(_, opts)
      local fittencode = require "fittencode"
      maps {
        v = {
          ["<leader>ae"] = {
            function()
              fittencode.explain_code {
                content = utils.Gets_selected_text(),
              }
            end,
            desc = "解释代码",
          },
        },
      }
      -- 设置
      fittencode.setup(opts)
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
  {
    "echasnovski/mini.move",
    event = "BufEnter",
    -- No need to copy this inside `setup()`. Will be used automatically.
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Move visual selection in Visual mode.
        left = "<M-H>",
        right = "<M-L>",
        down = "<M-J>",
        up = "<M-K>",

        -- Move current line in Normal mode
        line_right = "<Tab>",
        line_left = "<S-Tab>",
        line_down = "<M-J>",
        line_up = "<M-K>",
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    },
  },
}
