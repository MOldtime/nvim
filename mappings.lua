-- mnode http://yyq123.github.io/learn-vim/learn-vi-51-KeyMapping.html
--					                                          		*map-table*
-- Mode           | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- Command        +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
local tool = require "user.tools.command"
return {
  [""] = {
    ["<leader>`"] = { "~", desc = "把小写转换为大写" },
    ["<M-p>"] = { "<middlemouse>", desc = "粘贴系统剪切板" },
    ["<leader>zr"] = { function() vim.api.nvim_command "e!" end, desc = "重新加载文件" },
  },
  ["!"] = {
    ["<M-p>"] = { "<middlemouse>", desc = "粘贴系统剪切板" },
  },
  -- first key is the mode
  n = {
    ["<leader>q"] = {
      function()
        local b = 1
        local tabpage = vim.api.nvim_get_current_tabpage()
        local wins = vim.api.nvim_tabpage_list_wins(tabpage)
        for _, win in ipairs(wins) do
          local buf = vim.api.nvim_win_get_buf(win)
          local buf_name = vim.api.nvim_buf_get_name(buf)
          local file_name = vim.fn.fnamemodify(buf_name, ":t")
          if file_name == "neo-tree filesystem [1]" then
            b = b + 1
            break
          end
        end
        if vim.api.nvim_win_get_number(0) > b then
          vim.cmd "q"
          return
        end
        local unsaved_files = {}
        -- 获取所有已修改但未保存的文件
        for _, buffer in ipairs(vim.fn.getbufinfo { modified = true, buflisted = true }) do
          -- 检查缓冲区是否有文件名
          if buffer.name ~= "" then
            -- 检查文件是否已保存
            if vim.api.nvim_buf_get_option(buffer.bufnr, "modified") then table.insert(unsaved_files, buffer.name) end
          end
        end

        -- 检查是否有未保存的文件
        local num_unsaved_files = #unsaved_files
        if num_unsaved_files > 0 then
          -- 构建提示消息
          local message = "以下文件有未保存的更改:\n"
          for i, file in ipairs(unsaved_files) do
            message = string.format("%s%d. %s\n", message, i, file)
          end
          message = message .. "是否仍然退出?"

          -- 提示用户是否要继续退出
          local choice = vim.fn.confirm(message, "&Yes\n&No", 2)
          if choice == 2 then
            -- 如果用户选择“否”，则取消退出
            return
          end
        end

        -- 如果没有未保存的文件，则退出 Neovim
        vim.cmd "q!"
      end,
      desc = "Quit",
    },
    ["<M-p>"] = { '"+p', desc = "输入时粘贴系统剪切板" },
    ["<tab>"] = { "v>", desc = "缩进" },
    ["<s-tab>"] = { "v<", desc = "缩进" },
    ["<M-h>"] = { "^", desc = "移动到行首" },
    ["<M-l>"] = { "$", desc = "移动到行尾" },
    ["<M-J>"] = {
      function()
        if vim.api.nvim_win_get_cursor(0)[1] < vim.api.nvim_buf_line_count(0) then vim.api.nvim_command "m +1" end
      end,
      desc = "选择当前向下移动",
    },
    ["<M-K>"] = {
      function()
        if vim.api.nvim_win_get_cursor(0)[1] > 1 then vim.api.nvim_command "m -2" end
      end,
      desc = "选择当前向上移动",
    },
  },
  v = {
    ["<M-J>"] = {
      function()
        tool.LazyConmand(function()
          local start_pos = vim.fn.getpos "'<"
          local end_pos = vim.fn.getpos "'>"
          local end_line = end_pos[2]
          if end_line < vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_command(start_pos[2] .. "," .. end_line .. "m" .. end_line + 1)
          end
          vim.api.nvim_input "gv"
        end)
      end,
      desc = "选择当前向下移动",
    },
    ["<M-K>"] = {
      function()
        tool.LazyConmand(function()
          local start_pos = vim.fn.getpos "'<"
          local end_pos = vim.fn.getpos "'>"
          local start_line = start_pos[2]
          if start_line > 1 then vim.api.nvim_command(start_line .. "," .. end_pos[2] .. "m" .. start_line - 2) end
          vim.api.nvim_input "gv"
        end)
      end,
      desc = "选择当前向上移动",
    },
    ["<M-l>"] = { "$", desc = "移动到行尾" },
    ["<M-h>"] = { "^", desc = "移动到行首" },
    ["<M-y>"] = { '"+y', desc = "复制文字到系统" },
    ["<M-f>"] = { "<Esc>*", desc = "选中文本在当前的文件搜索" },
  },
  i = {
    ["<M-h>"] = { "<Esc>^i", desc = "移动到行首" },
    ["<M-l>"] = { "<Esc>$a", desc = "移动到行尾" },
    ["<M-CR>"] = { "<Esc>o", desc = "下一行" },
    ["<M-f>"] = { "%" },
    ["<M-j>"] = { "^" },
  },
}
