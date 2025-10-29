return {
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
}
