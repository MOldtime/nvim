return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-calc",
    },
    event = "InsertEnter",
    opts = {
      -- performance.max_view_entries = 100, -- 最大条目
      experimental = {
        ghost_text = { hlgroup = "Comment" }, -- 显示出来
      },
    },
    config = function(_, opts)
      local cmp = require "cmp"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local lspkind = require "lspkind"
      opts.formatting = {
        format = lspkind.cmp_format {
          with_text = true, -- do not show text alongside icons
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          before = function(entry, vim_item)
            -- Source 显示提示来源
            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
            return vim_item
          end,
        },
      }
      -- local function has_words_before()
      --   local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
      --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      -- end
      for key, value in pairs {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            cmp.confirm { select = true }
            -- elseif has_words_before() then
            --   vim.notify "has_words_before"
            --   cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<M-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<M-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      } do
        opts.mapping[key] = value
      end

      opts.sources = cmp.config.sources {
        { name = "luasnip", priority = 1000 },
        { name = "nvim_lsp", priority = 1000 },
        { name = "buffer", priority = 750 },
        { name = "path", priority = 500 },
        { name = "calc", priority = 250 },
      }
      cmp.setup(opts)
    end,
  },
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      for key, value in ipairs {
        Codeium = "",
      } do
        opts.symbol_map[key] = value
      end
    end,
  },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function()
  --     require("luasnip.loaders.from_vscode").lazy_load({})
  --     require "plugins.configs.luasnip"
  --   end
  -- }
}
