local M = {}

-- 获取选中的字符
--- @return string 选中的字符
function M.Gets_selected_text()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

--- 改变描述
function M.Assignment(tables, key, desc)
  if tables[key] then
    tables[key].desc = desc
  end
end

---设置文件的格式, 来启动对应的lsp服务器
function M.SetFileType()
  vim.api.nvim_command("set filetype=" .. string.gsub(vim.fn.input("Set File Type:"), "^%s*", ""))
end

--- 设置文件编码
function M.SetFileEncoding()
  vim.api.nvim_command("set fileencoding=" .. string.gsub(vim.fn.input("Set File Encoding:"), "^%s*", ""))
end

function M.Systemos()
  local name = vim.loop.os_uname().sysname
  if name == "Windows_NT" then
    return "windows"
  elseif name == "LInux" then
    return "linux"
  end
end

return M
