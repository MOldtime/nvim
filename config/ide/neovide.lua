-- local alpha = function() return string.format("%x", math.floor(255 * vim.g.transparency or 1.0)) end

local g = vim.g
vim.o.guifont = "JetBrainsMono_Nerd_Font_Mono,JetBrainsMonoNl_Nerd_Font_Mono,NotoSansM_Nerd_Font_Mono:h11:b:#e-antialias:#h-full"
-- vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h11:#e-antialias:#h-ful"
-- vim.o.guifont = "NotoSansM Nerd Font:h11:#e-antialias:#h-ful"

-- neovideconfig.neovide_theme = "dark"
-- debug
-- neovideconfig.neovide_profiler = true
-- 没有空闲
-- neovideconfig.neovide_no_idle = true

-- 退出需要确认
g.neovide_confirm_quit = true
-- 记住以前窗口的大小
g.neovide_remember_window_size = true
-- 输入时隐藏鼠标
g.neovide_hide_mouse_when_typing = true

-- 触控板死亡地带
-- neovideconfig.neovide_touch_deadzone = 4.0
-- 触控板拖动超时
-- neovideconfig.neovide_touch_drag_timeout = -1.17

-- 开启轨道动画
-- g.neovide_cursor_vfx_mode = "railgun"
-- 粒子透明度
-- neovideconfig.neovide_cursor_vfx_opacity = 99.0
-- 粒子寿命
-- neovideconfig.neovide_cursor_vfx_particle_lifetime = 1.0
-- 粒子密度
-- neovideconfig.neovide_cursor_vfx_particle_density = 50.0
-- 动画时长
g.neovide_cursor_animation_length = 0.1
-- 光标尾部
g.neovide_cursor_trail_size = 0.5

-- 设置刷新率
g.neovide_refresh_rate = 165
-- 空闲刷新率
g.neovide_refresh_rate_idle = 30

-- 透明背景
-- g.neovide_transparency = 0.9
