return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      local lspkind_status_ok, lspkind = pcall(require, "lspkind")
      local utils = require "astronvim.utils"
      if not snip_status_ok then return end
      local border_opts = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }

      local function has_words_before()
        local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind_status_ok
            and lspkind.cmp_format {
              with_text = true, -- do not show text alongside icons
              maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
              before = function(entry, vim_item)
                -- Source 显示提示来源
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
              end,
            }
          or nil,
      }

      opts.mapping['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }
      )
      opts.mapping['<S-Tab>'] =  cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" })
      opts.mapping['<C-Space>'] = nil  
      opts.mapping['<C-k>'] = nil  
      opts.mapping['<C-j>'] = nil  
      opts.mapping['<M-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }
      opts.mapping['<M-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
      return opts
    end,
  },
}
