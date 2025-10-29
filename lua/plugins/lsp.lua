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
		},
	},
}
