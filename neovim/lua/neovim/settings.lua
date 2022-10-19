-- [[ http://neovim.io/doc/user/options.html#option-summary ]]

local opt = vim.opt
local g = vim.g

-- Netrw (disable for nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Clipboard
--opt.clipboard:append({"unnamed", "unnamedplus"})

-- Gutter
opt.number = true
opt.numberwidth = 5
opt.relativenumber = true
opt.signcolumn = "yes"

-- Delays and timing
opt.timeoutlen = 500
opt.updatetime = 250

-- Indentation
opt.breakindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = -1
opt.tabstop = 2

-- Coding
opt.foldmethod = "indent"
opt.foldlevelstart = 99
opt.showmatch = true
opt.syntax = "OFF"
opt.completeopt = {"menu", "menuone", "noselect"}

-- Text wrap
opt.breakindent = true
opt.linebreak = true
opt.textwidth = 0
opt.wrap = true

-- Cursor
opt.list = true
opt.listchars = "eol:¬,space:·,lead:⬝,trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
opt.scrolloff = 8

-- Mouse
opt.mouse = "a"

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.tagcase = "followscs"

-- File formatting
opt.bomb = false
opt.encoding = "UTF-8"
opt.endofline = true
opt.fileencoding = "UTF-8"
opt.fileformat = "unix"
opt.fixendofline = true

-- File undo and file backup
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.writebackup = false

-- Commandline
opt.history = 250
opt.showmode = false
opt.wildmode = "list:full"

-- Buffers and windows
opt.splitbelow = true
opt.splitright = true
