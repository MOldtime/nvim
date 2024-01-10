vim.o.guifont = "JetBrainsMono_Nerd_Font_Mono,JetBrainsMonoNl_Nerd_Font_Mono,NotoSansM_Nerd_Font_Mono:h13:b"

for key, value in pairs {
  -- debug
  -- neovide_profiler = true
  -- 没有空闲
  -- neovideconfig.neovide_no_idle = true

  -- 退出需要确认
  -- neovide_confirm_quit = true
  -- 记住以前窗口的大小
  neovide_remember_window_size = true,
  -- 输入时隐藏鼠标
  neovide_hide_mouse_when_typing = true,

  -- 开启轨道动画
  -- neovide_cursor_vfx_mode = "railgun",
  -- -- 粒子透明度
  -- neovide_cursor_vfx_opacity = 80.0,
  -- -- 粒子寿命
  -- neovide_cursor_vfx_particle_lifetime = 1.0,
  -- -- 粒子密度
  -- neovide_cursor_vfx_particle_density = 50.0,
  -- -- 动画时长
  -- neovide_cursor_animation_length = 0.2,
  -- -- 光标尾部
  -- neovide_cursor_trail_size = 0.3,
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
