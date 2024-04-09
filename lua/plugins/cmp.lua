return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-calc",
      "FelipeLema/cmp-async-path",
      "amarakon/nvim-cmp-fonts"
    },
    event = "InsertEnter",
    opts = {
      -- performance.max_view_entries = 100, -- 最大条目
      experimental = {
        -- ghost_text = { hlgroup = "Comment" }, -- 显示出来
      },
      matching = { -- 匹配方式
        disallow_fuzzy_matching = false,
        disallow_fullfuzzy_matching = false,
        disallow_partial_fuzzy_matching = true,
        disallow_partial_matching = true,
        disallow_prefix_unmatching = false,
      },
    },
    config = function(_, opts)
      local cmp = require "cmp"
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local function has_words_before()
        local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
      for key, value in pairs {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              -- vim.notify("1")
              cmp.confirm { select = true }
            else
              -- vim.notify("2")
              cmp.confirm()
            end
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
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
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 900 },
        {
          name = "buffer",
          priority = 750,
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                if byte_size < 1024 * 1024 then -- 1 Megabyte max
                  bufs[buf] = true
                end
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
        { name = "async_path", priority = 500 },
        { name = "calc", priority = 250 },
        { name = "fonts", priority = 250 }
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
