-- [[ https://neovim.io/doc/user/map.html#key-mapping ]]
-- [[ https://stackoverflow.com/a/16117216/7641789 ]]

local map = vim.keymap.set
local g = vim.g

-- <Leader>
g.mapleader = "\\"
g.maplocalleader = "\\"

-- Working directory
map("n", "<leader>cd", "<CMD>cd %:p:h<CR><CWD>pwd<CR>", {desc = "Change Directory to current buffer's location (:cd)"})

-- Buffers
map("n", "<leader>[[", "<CMD>bp<CR>", {desc = "Prev buffer (:bp)"})
map("n", "<leader>]]", "<CMD>bn<CR>", {desc = "Next buffer (:bn)"})

-- Search and highlights
map("n", "<leader>//", "<CMD>noh<CR>", {desc = "Hide search highlights (:noh)"})

-- LSP [[ https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L255 ]]


-- ./lua/neovim/plugins/nvim-treesitter.lua | https://github.com/nvim-treesitter/nvim-treesitter
--[[
-- nvim-treesitter
init_selection = "gs",
node_incremental = "gs",
node_decremental = "gS",
scope_incremental = "<leader>gc",
--]]

-- ./lua/neovim/plugins/nvim-treesitter.lua | https://github.com/nvim-treesitter/nvim-treesitter-textobjects
--[[
["af"] = "@function.outer",
["if"] = "@function.inner",
["ac"] = "@class.outer",
["ic"] = "@class.inner",
["al"] = "@loop.outer",
["il"] = "@loop.inner",
["aa"] = "@parameter.outer",
["ia"] = "@parameter.inner",
["uc"] = "@comment.outer",
--]]

-- ./lua/neovim/plugins/nvim-treesitter.lua | https://github.com/nvim-treesitter/nvim-treesitter-refactor
--[[
smart_rename = "grr",
goto_definition = "gnd",
list_definitions = "gnD",
list_definitions_toc = "gO",
goto_next_usage = "<a-*>",
goto_previous_usage = "<a-#>",
--]]

-- ./lua/neovim/plugins/gitsigns.lua | https://github.com/lewis6991/gitsigns.nvim
--[[
-- Navigation
map("n", "]c", function()
  if vim.wo.diff then return "]c" end
  vim.schedule(function() gs.next_hunk() end)

  return "<Ignore>"
end, {expr=true})

map("n", "[c", function()
  if vim.wo.diff then return "[c" end
  vim.schedule(function() gs.prev_hunk() end)

  return "<Ignore>"
end, {expr=true})

-- Actions
map({"n", "v"}, "<leader>hr", gs.reset_hunk, {buffer = buf})
map({"n", "v"}, "<leader>hs", gs.stage_hunk)
map("n", "<leader>hS", gs.stage_buffer, {buffer = buf})
map("n", "<leader>hp", gs.preview_hunk, {buffer = buf})

-- Text object
map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", {buffer = buf})
--]]

-- ./lua/neovim/plugins/git-messenger.lua | https://github.com/rhysd/git-messenger.vim
map("n", "gm", "<CMD>GitMessenger<CR>", {desc = "Show line's git history"})

-- ./lua/neovim/plugins/nvim-tree.lua | https://github.com/nvim-tree/nvim-tree.lua
map("n", "<C-n>", "<CMD>NvimTreeFocus<CR>", {desc = "Open (if closed) and focus in nvim-tree"})

-- ./lua/neovim/plugins/telescope.lua | https://github.com/nvim-telescope/telescope.nvim
map("n", "<leader>ff", "<CMD>Telescope find_files hidden=true<CR>", {desc = "Open telescope find_file"})
map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", {desc = "Open telescope live_grep"})
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", {desc = "Open telescope buffers"})
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", {desc = "Open telescope help_tags"})

-- ./lua/neovim/plugins/telescope.lua | https://github.com/nvim-telescope/telescope-file-browser.nvim
map("n", "<leader>fd", "<CMD>Telescope file_browser hidden=true<CR>", {desc = "Open telescope file_browser"})

-- ./lua/neovim/plugins/nvim-cmp.lua | https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
--[[
["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-3), {"i", "c"}),
["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(3), {"i", "c"}),
["<C-e>"] = cmp.mapping({
  i = cmp.mapping.abort(),
  c = cmp.mapping.close(),
}),
["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
["<CR>"] = cmp.mapping.confirm({select = false}),

["<Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.jumpable(1) then
    luasnip.jump(1)
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif luasnip.expandable() then
    luasnip.expand()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end, {"i", "s"}),

["<S-Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end, {"i", "s"}),
--]]

-- ./lua/neovim/plugins/mason-null-ls.lua | https://github.com/jose-elias-alvarez/null-ls.nvim/wiki
