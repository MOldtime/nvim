return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    -- include the default astronvim config that calls the setup call
    require "plugins.configs.luasnip"(plugin, opts)
    -- load snippets paths
    require("luasnip.loaders.from_vscode").lazy_load {
      -- this can be used if your configuration lives in ~/.config/nvim
      -- if your configuration lives in ~/.config/astronvim, the full path
      -- must be specified in the next line
      paths = { "./lua/snippets" },
    }
    require("luasnip").filetype_extend("typescript", { "tsdoc" })
    require("luasnip").filetype_extend("javascript", { "jsdoc" })
    require("luasnip").filetype_extend("lua", { "luadoc" })
    require("luasnip").filetype_extend("python", { "pydoc" })
    require("luasnip").filetype_extend("rust", { "rustdoc" })
    require("luasnip").filetype_extend("cs", { "csharpdoc" })
    require("luasnip").filetype_extend("java", { "javadoc" })
    require("luasnip").filetype_extend("c", { "cdoc" })
    require("luasnip").filetype_extend("cpp", { "cppdoc" })
    require("luasnip").filetype_extend("php", { "phpdoc" })
    require("luasnip").filetype_extend("kotlin", { "kdoc" })
    require("luasnip").filetype_extend("ruby", { "rdoc" })
    require("luasnip").filetype_extend("sh", { "shelldoc" })
  end,
}
