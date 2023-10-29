M = {}

--- Returns a 2D Array by file type with names and the paths.
--- @param fileType string: suffix of the file type.
--- @return Array
function M.get_files_by_end(fileType, path)
  fileType = (".*%." .. fileType .. "$") or ""
  path = path or false

  local function match_file(name)
    return name:match(fileType)
  end

  local find = vim.fs.find(match_file, { type = "file", limit = math.huge })
  local files = {}

  if #find > 1 then
    if path then
      for _, value in ipairs(find) do
        local name = vim.fs.basename(value)
        local new_path = value:gsub(vim.fn.getcwd(), "")
        table.insert(files, { tostring(name), tostring(new_path) })
      end
    else
      for _, value in ipairs(find) do
        local name = vim.fs.basename(value)
        table.insert(files, { tostring(name), tostring(value) })
      end
    end
  end

  return files
end

--- Returns working directory.
--- @return string
function M.is_win()
  return ""
end

return M
