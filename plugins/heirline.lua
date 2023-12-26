-- https://github.com/rebelot/heirline.nvim
return {
  "rebelot/heirline.nvim",
  dependencies = { "SmiteshP/nvim-navic" },
  opts = function(_, opts)
    local utils = require "astronvim.utils"
    local status = require "astronvim.utils.status"
    local get_icon = utils.get_icon

    -- 输入一个颜色，返回一个新的颜色
    --- @param hex_color string 颜色，16进制
    --- @param transparency number 透明度，小于1
    local lighten_color = function(hex_color, transparency)
      local r = tonumber(string.sub(hex_color, 2, 3), 16)
      local g = tonumber(string.sub(hex_color, 4, 5), 16)
      local b = tonumber(string.sub(hex_color, 6, 7), 16)

      -- 计算新的RGB值
      r = math.floor(r * transparency)
      g = math.floor(g * transparency)
      b = math.floor(b * transparency)

      -- 将RGB值转换为16进制颜色字符串
      return string.format("#%02x%02x%02x", r, g, b)
    end

    local mode_color = function() return lighten_color(status.hl.lualine_mode(status.hl.mode_bg(), "#ffffff"), 0.65) end
    local mode_text_color = function() return lighten_color(status.hl.lualine_mode(status.hl.mode_bg(), "#ffffff"), 0.2) end

    local mode_icon = function()
      local mode_text = status.env.modes[vim.fn.mode()][1]
      local get_mode = vim.fn.mode()
      local mode = get_mode:lower()
      local icon
      if mode == "n" then icon = " " end
      if mode == "i" or mode == "t" then icon = "ﲅ " end
      if mode == "v" or mode == "�" then icon = " " end
      if mode == "r" then icon = " " end
      if mode == "c" then icon = " " end
      if icon == nil then icon = get_icon "VimIcon" .. " " end
      return " " .. icon .. mode_text .. " "
    end

    -- Displays Macros
    local show_macro_recording = function()
      local recording_register = vim.fn.reg_recording()
      if recording_register == "" then
        return " "
      else
        return "壘" .. recording_register .. " "
      end
    end

    opts.winbar = nil
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },

      status.component.builder {
        { provider = function() return mode_icon() end },
        hl = { fg = "bg" },
        surround = {
          separator = "left",
          color = function() return { main = status.hl.mode_bg(), right = mode_color() } end,
        },
      },
      status.component.builder {
        { provider = show_macro_recording },
        hl = function() return { fg = mode_text_color(), bold = true } end,
        surround = {
          separator = "left",
          color = function() return { main = mode_color(), right = "file_info_bg" } end,
        },
      },
      status.component.builder {
        { provider = "" },
        surround = { separator = "left", color = { main = "file_info_bg", right = "bg" } },
      },
      status.component.git_branch { surround = { separator = "none" } },
      status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
      status.component.fill(),
      { -- create custom winbar
        -- store the current buffer number
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false, -- pick the correct winbar based on condition
        -- inactive winbar
        {
          condition = function() return not status.condition.is_active() end,
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info {
            file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
        -- active winbar
        {
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
          -- add the file name and icon
          status.component.file_info { -- add file_info to breadcrumbs
            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
          },
          -- show the breadcrumbs
          status.component.breadcrumbs {
            icon = { hl = true },
            hl = status.hl.get_attributes("winbar", true),
            prefix = true,
            padding = { left = 0 },
          },
        },
      },
      status.component.fill(),
      status.component.diagnostics { surround = false, padding = { right = 2 } },
      status.component.lsp { lsp_progress = false, surround = false },
      status.component.treesitter(),
      {
        status.component.builder {
          { provider = utils.get_icon "FolderClosed" },
          padding = { right = 1 },
          hl = { fg = "bg" },
          surround = { separator = "right", color = "folder_icon_bg" },
        },
        status.component.file_info {
          filename = { fname = function(nr) return vim.fn.getcwd(nr) end, padding = { left = 1 } },
          file_icon = false,
          file_modified = false,
          file_read_only = false,
          surround = { separator = "none", color = "file_info_bg", condition = false },
        },
      },
      { -- make nav section with icon border
        status.component.builder {
          { provider = utils.get_icon "ScrollText" },
          padding = { right = 1 },
          hl = { fg = "bg" },
          surround = { separator = "right", color = { main = "nav_icon_bg", left = "file_info_bg" } },
        },
        status.component.nav {
          percentage = { padding = { right = 1 } },
          ruler = { padding = { left = 1 } },
          scrollbar = false,
          surround = { separator = "none", color = "file_info_bg" },
        },
      },
    }
    return opts
  end,
}
