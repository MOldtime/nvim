return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			["*"] = {
				keys = {
					{ "M-p", false },
					{ "<M-n>", false },
				},
			},
			lua_ls = {
				cmd = { "lua-language-server", "--locale=zh-cn" },
				settings = {
					Lua = {
						hint = {
							enable = true,
							arrayIndex = "Disable",
						},
						format = {
							enable = true,
							-- Put format options here
							-- NOTE: the value should be String!
						},
					},
				},
			},
			clangd = {
				cmd = { "clangd", "--fallback-style=WebKit" },
			},
			kotlin_lsp = {
				cmd = { "kotlin-lsp", "--stdio" },
				single_file_support = true,
				filetypes = { "kotlin" },
				root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
			},
			ts_ls = {
				settings = {
					javascript = {
						referencesCodeLens = {
							enabled = true,
							showOnAllFunctions = true,
						},
					},
				},
			},
		},
	},
}
