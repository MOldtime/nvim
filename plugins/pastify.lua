-- 截图工具
return {
	"TobinPalmer/pastify.nvim",
  cmd = { 'Pastify' },
  event = {
    "BufReadPre *.md", -- markdown
    "BufReadPre *.html", -- html
    -- "BufReadPre *.html", -- tex 
  },
  opts = function (_,opts)
    return opts
  end
}
