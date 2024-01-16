return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.experimental = {
        ghost_text = { hlgroup = "Comment" },
      }
      local utils = require "astronvim.utils"
      local cmp = require "cmp"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local function has_words_before()
        local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      for key, value in pairs {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            cmp.confirm { select = true }
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<M-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<M-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      } do
        opts.mapping[key] = value
      end

      utils.list_insert_unique(opts.sources, { group_index = 1, name = "codeium", priority = 950 })
      return opts
    end,
  },
  {
    "onsails/lspkind.nvim",
    opts = {
      mode = "symbol",
      symbol_map = {
        Text = "", --
        Method = "", --
        Function = "", --
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "", --
        Interface = "", --
        Module = "", --
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "", --
        Operator = "",
        TypeParameter = "",
        Codeium = "",
      },
    },
  },
}
