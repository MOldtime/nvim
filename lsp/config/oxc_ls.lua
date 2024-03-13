local util = require "lspconfig.util"
return {
  -- cmd = { "oxc_language_server" },
  cmd = { "C:/APP_File/File_Data/Language Server Protocol/oxc/oxc_language_server.exe" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_dir = function(fname)
    return util.find_package_json_ancestor(fname)
      or util.find_node_modules_ancestor(fname)
      or util.find_git_ancestor(fname)
      or vim.fn.getcwd()
  end,
  single_file_support = true,
  settings = {
    ["enable"] = true,
    ["run"] = "onType",
  },
}
