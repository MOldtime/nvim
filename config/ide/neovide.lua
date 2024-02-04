vim.o.guifont = "JetBrainsMono Nerd Font,"
  .. "JetBrainsMono Nerd Font Propo,"
  .. "JetBrainsMonoNL Nerd Font,"
  .. "JetBrainsMonoNL Nerd Font Propo,"
  .. "Noto Sans Sc"
  .. ":h14:b:#e-subpixelantialias"

for key, value in pairs {
  -- neovide_profiler = true, -- debug
  -- neovide_no_idle = true, -- 没有空闲

  -- neovide_confirm_quit = true -- 退出需要确认
  neovide_remember_window_size = true, -- 记住以前窗口的大小
  neovide_hide_mouse_when_typing = true, -- 输入时隐藏鼠标
  -- neovide_refresh_rate = 165, -- 刷新率
  -- neovide_unlink_border_highlights = true, -- 修复边框和 winbar 滚动故障

  -- 浮影
  neovide_floating_blur_amount_x = 5.0, -- 浮动模糊量
  neovide_floating_blur_amount_y = 5.0, -- 浮动模糊量
  neovide_floating_shadow = true, --  false 将禁用浮动窗口的阴影边框
  neovide_floating_z_height = 10, -- 设置浮窗距地平面的虚拟高度
  neovide_light_angle_degrees = 45, -- 设置投射光与屏幕法线的角度
  neovide_light_radius = 5, -- 设置投射光的半径

  neovide_cursor_antialiasing = true, -- 启用或禁用光标四边形的抗锯齿功能。禁用可能会修复一些光标视觉问题。
  neovide_cursor_animate_in_insert_mode = true, -- 在插入模式下制作动画
  neovide_cursor_unfocused_outline_width = 0, -- 未聚焦的轮廓宽度

  -- neovide_cursor_vfx_mode = "railgun", 开启轨道动画
  -- neovide_cursor_vfx_opacity = 80.0, -- 粒子透明度
  -- neovide_cursor_vfx_particle_lifetime = 1.0, -- 粒子寿命
  -- neovide_cursor_vfx_particle_density = 50.0, -- 粒子密度
  neovide_cursor_animation_length = 0.1, -- 动画时长
  -- neovide_cursor_trail_size = 0.3, -- 光标尾部
  neovide_scale_factor = 0.8 -- 除了设置字体本身之外，此设置还允许更改比例而不更改整个字体定义。对于演示非常有用。请参阅有关此问题的常见问题解答部分，了解将其绑定到热键的好方法。

  -- neovide_transparency = 0.9, -- 透明度
} do
  vim.g[key] = value
end

-- 禁用输入法
local function set_ime(args)
  if args.event:match "Enter$" then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = ime_input,
  pattern = "*",
  callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  group = ime_input,
  pattern = "[/\\?]",
  callback = set_ime,
})
