if not vim.g.neovide then return end
vim.o.guifont = "JetBrainsMono Nerd Font,"
  .. "JetBrainsMono Nerd Font Propo,"
  .. "JetBrainsMonoNL Nerd Font,"
  .. "JetBrainsMonoNL Nerd Font Propo,"
  .. (vim.loop.os_uname().sysname == "Windows_NT" and "Noto Sans" or "MiSans")
  .. ":h13:#e-subpixelantialias"

for key, value in pairs {
  -- neovide_profiler = true, -- debug
  -- neovide_no_idle = true, -- 没有空闲

  -- neovide_confirm_quit = true -- 退出需要确认
  neovide_remember_window_size = true, -- 记住以前窗口的大小
  neovide_hide_mouse_when_typing = true, -- 输入时隐藏鼠标
  -- neovide_refresh_rate = 165, -- 刷新率
  -- neovide_unlink_border_highlights = true, -- 修复边框和 winbar 滚动故障
  neovide_cursor_antialiasing = true, -- 启用或禁用光标四边形的抗锯齿功能。禁用可能会修复一些光标视觉问题。
  neovide_cursor_animate_in_insert_mode = true, -- 在插入模式下制作动画
  neovide_cursor_unfocused_outline_width = 0, -- 未聚焦的轮廓宽度

  -- neovide_scroll_animation_length = 0.3, -- 滚动动画时长
  neovide_scroll_animation_far_lines = 999, -- 远距离滚动的行数

  -- neovide_cursor_vfx_mode = "railgun", -- 开启轨道动画
  -- neovide_cursor_vfx_opacity = 80.0, -- 粒子透明度
  -- neovide_cursor_vfx_particle_lifetime = 0.5, -- 粒子寿命
  -- neovide_cursor_vfx_particle_density = 30.0, -- 粒子密度
  neovide_cursor_animation_length = 0.2, -- 动画时长
  neovide_cursor_trail_size = 0.3, -- 光标尾部
  -- neovide_scale_factor = 0.8, -- 除了设置字体本身之外，此设置还允许更改比例而不更改整个字体定义。对于演示非常有用。请参阅有关此问题的常见问题解答部分，了解将其绑定到热键的好方法。
  neovide_srgb = true,

  neovide_padding_top = 5,
  neovide_padding_right = 5,
  neovide_padding_left = 5,
  neovide_window_blurred = true,
  neovide_cursor_smooth_blink = true,
  neovide_floating_corner_radius = 0.3
} do
  vim.g[key] = value
end

-- 禁用输入法
-- local function set_ime(args)
--   if args.event:match "Enter$" then
--     vim.g.neovide_input_ime = true
--   else
--     vim.g.neovide_input_ime = false
--   end
-- end
--
-- local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
--   group = ime_input,
--   pattern = "*",
--   callback = set_ime,
-- })
--
-- vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
--   group = ime_input,
--   pattern = "[/\\?]",
--   callback = set_ime,
-- })
