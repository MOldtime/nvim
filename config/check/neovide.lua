local neovideconfig = vim.g
vim.o.guifont = "CaskaydiaCove Nerd Font:h13"
-- 没有空闲
neovideconfig.neovide_no_idle = true
-- 退出需要确认
neovideconfig.neovide_confirm_quit = true
-- 是否全屏
neovideconfig.neovide_fullscreen = false
-- 记住以前窗口的大小
neovideconfig.neovide_remember_window_size = true
-- 使用super键位,比如<cmd>
-- neovideconfig.neovide_input_use_logo = true
-- 开启Alt和Meta按键
neovideconfig.neovide_input_macos_alt_is_meta = true
-- 触控板死亡地带
-- neovideconfig.neovide_touch_deadzone = 6.0
-- 触控板拖动超时
-- neovideconfig.neovide_touch_drag_timeout = 0.17
-- 开启轨道动画
neovideconfig.neovide_cursor_vfx_mode = "railgun"
-- 粒子透明度
neovideconfig.neovide_cursor_vfx_opacity = 200.0
-- 粒子寿命
neovideconfig.neovide_cursor_vfx_particle_lifetime = 1
-- 粒子密度
neovideconfig.neovide_cursor_vfx_particle_density = 20.0
-- 粒子速度
neovideconfig.neovide_cursor_vfx_particle_speed = 5.0

-- 设置刷新率
neovideconfig.neovide_refresh_rate = 165
-- 空闲刷新率
neovideconfig.neovide_refresh_rate_idle = 60
-- 透明背景
neovideconfig.neovide_transparency = 1.0
neovideconfig.transparency = 0.9
-- 插入模式动画
-- neovideconfig.neovide_cursor_animate_in_insert_mode = true
-- 窗口模式 无法拖动位置
-- neovideconfig.NEOVIDE_FRAME = "none"
