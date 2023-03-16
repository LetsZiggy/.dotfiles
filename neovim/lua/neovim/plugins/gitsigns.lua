-- [[ https://github.com/lewis6991/gitsigns.nvim ]]

local map = vim.keymap.set

local config = {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function remap(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      map(mode, l, r, opts)
    end

    -- Navigation
    remap("n", "]c", function()
      if vim.wo.diff then return "]c" end
      vim.schedule(function() gs.next_hunk() end)

      return "<Ignore>"
    end, {desc = "", expr=true})

    remap("n", "[c", function()
      if vim.wo.diff then return "[c" end
      vim.schedule(function() gs.prev_hunk() end)

      return "<Ignore>"
    end, {desc = "", expr=true})

    -- Actions
    remap({"n", "v"}, "<leader>hr", gs.reset_hunk, {desc = "", buffer = bufnr})
    remap({"n", "v"}, "<leader>hs", gs.stage_hunk, {desc = ""})
    remap("n", "<leader>hS", gs.stage_buffer, {desc = "", buffer = bufnr})
    remap("n", "<leader>hp", gs.preview_hunk, {desc = "", buffer = bufnr})

    -- Text object
    remap({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", {desc = "", buffer = bufnr})
  end,
}

require("gitsigns").setup(config)
