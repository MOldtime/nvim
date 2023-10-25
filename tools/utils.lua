local M = {}

-- 获取选中的字符
-- 请注意，需要先取消选中状态，不然无法获取
--- @return string 选中的字符
function M.Gets_selected_text()
  local utf8 = require "utf8"
  local l_start = vim.fn.getpos("'<")[2]
  local l_end = vim.fn.getpos("'>")[2]
  local l_lines = vim.api.nvim_buf_get_lines(0, l_start - 1, l_end, false)
  local l_text = table.concat(l_lines, "\n")
  local end_char = vim.fn.col "'>"
  -- 最后
  local end_num = 1
  if vim.fn.col "$" == end_char or vim.fn.col "$" == end_char + 1 then -- 基本在最后一个字符
    end_num = string.len(l_text)
  else
    end_num = string.len(l_text) - string.len(vim.api.nvim_buf_get_lines(0, l_end - 1, l_end, false)[1]) + end_char
    end_num = (utf8.len(l_text) > end_num + 1 and utf8.len(l_text, end_num, end_num + 2) > 1) and end_num or end_num + 2 -- 判断是不是中文
  end
  return string.sub(l_text, vim.fn.col "'<", end_num)
  -- local text = string.sub(l_text, vim.fn.col "'<", end_num)
  -- vim.notify("内容\n" .. text)
  -- return text
end

--- 改变描述
function M.Assignment(tables, key, desc)
  if tables[key] then tables[key].desc = desc end
end

return M
