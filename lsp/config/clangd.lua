--[[
 --enable-config
  file name:  clangd/config.yaml
  Windows: %USERPROFILE%\AppData\Local
  Mac OS: ~/Library/Preferences/
  Others: $XDG_CONFIG_HOME, usually ~/.config
--]]
--
return {
  cmd = { "clangd", "--fallback-style=WebKit"},
}
