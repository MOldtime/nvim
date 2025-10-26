return {
	-- cmp
	{
		"saghen/blink.cmp",
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<M-j>"] = { "select_next" },
				["<M-k>"] = { "select_prev" },
				["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<Enter>"] = { "accept", "fallback" },
				["<Esc>"] = { "cancel", "fallback" },
			},

			completion = {
				list = { selection = { preselect = false, auto_insert = true } },
				keyword = {
					range = "full",
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 300,
				},
			},

			signature = {
				enabled = true,
				window = {
					show_documentation = true,
				},
			},

			-- snippets = { preset = "luasnip" },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			on_create = function()
				vim.opt.foldcolumn = "0"
				vim.opt.signcolumn = "no"
			end,
			insert_mappings = true,
			terminal_mappings = true,
		},
		keys = {
			{ "fj", [[<C-\><C-n>]], mode = "t" },
		},
		config = function(_, opts)
			---@diagnostic disable-next-line: undefined-field
			if vim.loop.os_uname().sysname == "Windows_NT" then
				local powershell_options = {
					shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
					shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
					shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
					shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
					shellquote = "",
					shellxquote = "",
				}

				for option, value in pairs(powershell_options) do
					vim.opt[option] = value
				end
			end
			require("toggleterm").setup(opts)
		end,
	},
	{
		"folke/snacks.nvim",
		opts = {
			explorer = {
				
			}
		},
	},
}
