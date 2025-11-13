return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			["*"] = {
				keys = {
					{ "<M-p>", false },
					{ "<M-n>", false },
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
				init_options = {
					hostInfo = "neovim",
				},
			},
		},
	},
}
