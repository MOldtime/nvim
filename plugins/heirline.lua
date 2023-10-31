return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local astronvim = require "astronvim.utils"
    local status = require "astronvim.utils.status"
    -- local astronvim = require "utils.status"
    local mode_color = function()
      local get_mode = vim.fn.mode()
      local mode = get_mode:lower()
      if mode == "n" then return "#5B72AC" end
      if mode == "i" or mode == "t" then return "#6D8866" end
      if mode == "v" or mode == "�" then return "#7B6EAC" end
      if mode == "r" then return "#995C78" end
      if mode == "c" then return "#8E7965" end
    end

    -- Same function as above just used for text.
    local mode_text_color = function()
      local get_mode = vim.fn.mode()
      local mode = get_mode:lower()
      if mode == "n" then return "#E4F1FE" end
      if mode == "i" or mode == "t" then return "#C8F7C5" end
      if mode == "v" or mode == "�" then return "#FFECDB" end
      if mode == "r" then return "#FFECDB" end
      if mode == "c" then return "#FFFACD" end
    end

    -- like mode component but you can change the icon for each mode.
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
      -- default highlight for the entire statusline
      hl = { fg = "fg", bg = "bg" },

      -- add the vim mode component
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
      status.component.diagnostics { surround = { separator = "right" } },
      status.component.lsp { lsp_progress = false, surround = false },
      {
        status.component.builder {
          { provider = astronvim.get_icon "FolderClosed" },
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
          { provider = astronvim.get_icon "ScrollText" },
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
