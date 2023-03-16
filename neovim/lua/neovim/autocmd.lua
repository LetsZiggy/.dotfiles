-- [[ https://neovim.io/doc/user/autocmd.html ]]

local api = vim.api

-- nvim-tree | https://github.com/nvim-tree/nvim-tree.lua
api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("NVIM_TREE", {clear = true}),
  pattern = "NvimTree",
  callback = function()
    vim.api.nvim_win_set_option(0, "wrap", false)
  end,
})
