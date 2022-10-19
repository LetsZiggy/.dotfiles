-- [[ https://neovide.dev/configuration.html ]]

local opt = vim.opt
local g = vim.g
-- local fn = vim.fn
-- local cmd = vim.cmd

if g.neovide == true then --fn.exists("neovide") == 1
  opt.guifont = {"FiraCode Nerd Font", ":h12"} -- :ss01:ss04:ss08
  g.neovide_cursor_animation_length = 0.05
  g.neovide_cursor_trail_size = 0.5
  g.neovide_remember_window_size = false
end
