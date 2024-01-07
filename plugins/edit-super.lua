return {
  {
    -- 对齐插件 ga gA 接 ip
    -- jl lc jr, s= , = ,
    "echasnovski/mini.align",
    lazy = false,
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- @type Flash.Config
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
    -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
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
    lazy = false,
    opts = {
      -- acceleration_table = { 7,12,17,21,24,26,28,30 }
    },
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
    -- enabled = false,
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
    lazy = false,
    -- enabled = false,
    config = function()
      require("search-replace").setup {
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      }
    end,
  },
}
