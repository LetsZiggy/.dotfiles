-- [[  ]]

local opt = vim.opt
local fn = vim.fn
local cmd = vim.cmd

opt.background = "dark"
if fn.has("termguicolors") == 1 then
  opt.termguicolors = true
  require("neovim.plugins.tokyonight")
  cmd.colorscheme("tokyonight")
  -- cmd("hi LineNr guibg=none guifg=#767FA9")
end
