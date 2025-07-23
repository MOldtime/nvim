local maps = require("astrocore").set_mappings
local utils = require "tools.utils"
return {
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
      { "<Leader><Leader>", mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
      { "r",                mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",                mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      {
        "<Leader>zf",
        mode = { "n" },
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
                    m.label = m.label2 -- use the second label
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
    }
  },
  -- 多光标
  -- 基本用法:
  --    Alt + shift + down, up 设置垂直或向上光标
  --    down, up 选择光标
  --    Q 删除关标
  --    q 其它光标不动, q 添加光标
  --    n 查找下一个符合要求, N 上一个
  --    s 跳过下一个，S 跳过上一个
  {
    "jake-stewart/multicursor.nvim",
    event = "BufRead",
    config = function()
      local mc = require "multicursor-nvim"
      local hydra = require "hydra"
      local hydra_ = hydra {
        mode = { "n", "v" },
        name = "Multicursor",
        config = {
          hint = false,
          color = "pink",
          on_exit = function()
            if not mc.cursorsEnabled() then mc.enableCursors() end
            if mc.hasCursors() then mc.clearCursors() end
            vim.notify "exit multicursor"
          end,
          on_enter = function() vim.notify "enter multicursor" end,
        },
        heads = {
          { "<down>", mc.nextCursor },
          { "<up>",   mc.prevCursor },
          { "Q",      mc.deleteCursor },
          {
            "q",
            function()
              if mc.cursorsEnabled() then
                mc.disableCursors()
              else
                -- mc.enableCursors()
                mc.addCursor() -- 添加光标
              end
            end,
          },
          {
            "<Esc>",
            function()
              if not mc.cursorsEnabled() then
                mc.enableCursors()
              elseif mc.hasCursors() then
                mc.clearCursors()
                -- else
                -- Hydra:exit() -- bug: self.layer:exit()
              end
            end,
            { mode = "n" },
          },
          {
            "n",
            function() mc.matchAddCursor(1) end,
          },
          {
            "N",
            function() mc.matchAddCursor(-1) end,
          },
          {
            "s",
            function() mc.matchSkipCursor(1) end,
          },
          {
            "S",
            function() mc.matchSkipCursor(-1) end,
          },
          { "<F1>",      nil,                                    { exit = true } },
          { "<leader>a", mc.alignCursors,                        { mode = { "n", "v" } } },
          { "S",         mc.splitCursors,                        { mode = "v" } },
          { "I",         mc.insertVisual,                        { mode = "v" } },
          { "A",         mc.appendVisual,                        { mode = "v" } },
          { "M",         mc.matchCursors,                        { mode = "v" } },
          { "<leader>t", function() mc.transposeCursors(1) end,  { mode = "v" } },
          { "<leader>T", function() mc.transposeCursors(-1) end, { mode = "v" } },
        },
      }
      -- hydra:_enter()
      vim.keymap.set({ "n", "v" }, "<C-S-Up>", function()
        hydra_:activate()
        mc.addCursor "k"
      end)
      vim.keymap.set({ "n", "v" }, "<C-S-Down>", function()
        hydra_:activate()
        mc.addCursor "j"
      end)
      vim.keymap.set({ "n", "v" }, "<C-n>", function()
        hydra_:activate()
        mc.addCursor "*"
      end)
      vim.keymap.set({ "n", "v" }, "<C-s>", function()
        hydra_:activate()
        mc.skipCursor "*"
      end)
      vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
      vim.keymap.set("v", "<M-S-Space>", function() hydra_:activate() end)
      mc.setup()
    end,
  },
  --[[
      add / delete / change 这三个“核心”操作可以分别使用键映射
      ys{motion}{char} 、 ds{char} 和 cs{target}{replacement} 完成
      在以下示例中， * 表示光标位置：
      Old text                    Command         New text
      ----------------------------------------------------------------------
      surr*ound_words             ysiw)           (surround_words)
      *make strings               ys$"            "make strings"
      [delete ar*ound me!]        ds]             delete around me!
      remove <b>HTML t*ags</b>    dst             remove HTML tags
      'change quot*es'            cs'"            "change quotes"
      <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
      delete(functi*on calls)     dsf             function calls
  --]]
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufRead",
    config = function()
      require("nvim-surround").setup {
        move_cursor = false
        -- Configuration here, or leave empty to use defaults
      }
    end,
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
  -- fittencode ai
  {
    "luozhiya/fittencode.nvim",
    event = "InsertEnter",
    -- enabled = false,
    opts = {
      use_default_keymaps = false,
      keymaps = {
        inline = {
          ["<M-CR>"] = "accept_all_suggestions",
          ["<M-'>"] = "accept_line",
          ["<M-;>"] = "accept_word",
          ["<C-Tab>"] = "triggering_completion",
        },
        chat = {},
      },
      disable_specific_inline_completion = {
        -- Disable auto-completion for some specific file suffixes by entering them below
        -- For example, `suffixes = {'lua', 'cpp'}`
        suffixes = { "TelescopePrompt", "neo-tree-popup", "rip-substitute" },
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

  -- llm
  {
    'huggingface/llm.nvim',
    enabled = false,
    opts = {
      model = "deepseek-r1:1.5b",
      url = "http://localhost:11434", -- llm-ls uses "/api/generate"
      backend = 'ollama',
      -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
      request_body = {
        -- Modelfile options for the model you use
        options = {
          temperature = 0.2,
          top_p = 0.95,
        }
      }
    }
  },

  -- 添加标记 快速跳转
  {
    "LeonHeidelbach/trailblazer.nvim",
    event = "BufRead",
    opts = {
      force_mappings = {
        nv = {
          motions = {
            new_trail_mark = "<M-;>",         -- 新建一个标记
            track_back = "<M-o>",             -- 跳转到上一个，并清除
            peek_move_next_down = "<M-j>",    -- 跳转到到下一个
            peek_move_previous_up = "<M-k>",  -- 跳转到上一个
            move_to_nearest = "<M-n>",        -- 跳转到最近
            toggle_trail_mark_list = "<M-m>", -- 显示标记列表
          },
          actions = {
            --   delete_all_trail_marks = "<leader>md", -- 删除所有标记
            --   paste_at_last_trail_mark = "<leader>mp", -- 粘贴到最后一个标记
            --   paste_at_all_trail_marks = "<leader>mP", -- 粘贴到所有的标记
            --   set_trail_mark_select_mode = "<leader>mt", -- 将轨迹标记选择模式设置为给定模式或在可用模式之间切换
            --   switch_to_next_trail_mark_stack = "<leader>m.", -- 使用排序模式切换到下一个跟踪标记堆栈
            --   switch_to_previous_trail_mark_stack = "<leader>m,", -- 使用排序模式切换到上一个跟踪标记堆栈
            --   set_trail_mark_stack_sort_mode = "<leader>ms", -- 将跟踪标记堆栈排序模式设置为给定模式或在可用模式之间切换
          },
        },
      },
    },
  },
  -- 扩展 C-a, C-x, 切换true -> false...
  {
    "nat-418/boole.nvim",
    event = "BufRead",
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
    event = "BufRead",
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
  -- Search and Replace
  {
    "chrisgrieser/nvim-rip-substitute",
    event = "BufEnter",
    cmd = "RipSubstitute",
    keys = {
      {
        "<leader>r",
        function() require("rip-substitute").sub() end,
        mode = { "n", "x" },
        desc = " rip substitute",
      },
    },
    opts = {
      popupWin = {
        position = "top",
      },
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
}
