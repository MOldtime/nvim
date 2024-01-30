return function(hl)
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  -- use helper function to get highlight group properties
  local comment_fg = get_hlgroup("Comment").fg
  hl.git_branch_fg = comment_fg
  -- hl.git_added      = comment_fg
  hl.git_added = "#96D382"
  hl.git_changed = "#EACA89"
  hl.git_removed = "#EA7183"
  hl.blank_bg = get_hlgroup("Folded").fg
  hl.file_info_bg = get_hlgroup("Visual").bg
  hl.nav_icon_bg = get_hlgroup("String").fg
  hl.nav_fg = hl.nav_icon_bg
  hl.folder_icon_bg = get_hlgroup("Error").fg
  return hl
end
