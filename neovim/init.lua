-- ----------------------- --
-- -----Optimisation------ --
-- ----------------------- --
local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

-- ----------------------- --
-- -------Settings-------- --
-- ----------------------- --
require("neovim.settings")

-- ----------------------- --
-- -------Plugins--------- --
-- ----------------------- --
require("neovim.plugins")

-- ----------------------- --
-- -------Autocmd--------- --
-- ----------------------- --
require("neovim.autocmd")

-- ----------------------- --
-- -------Keymaps--------- --
-- ----------------------- --
require("neovim.keymaps")

-- ----------------------- --
-- -------Colours--------- --
-- ----------------------- --
require("neovim.colours")

-- ----------------------- --
-- -------Neovide--------- --
-- ----------------------- --
require("neovim.neovide")
