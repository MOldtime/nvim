--- @type vim.lsp.Config
return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		-- "vue"
	},
	single_file_support = true,
	-- root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
	settings = {
		javascript = {
			referencesCodeLens = {
				enabled = true,
				showOnAllFunctions = true,
			},
		},
	},
}
