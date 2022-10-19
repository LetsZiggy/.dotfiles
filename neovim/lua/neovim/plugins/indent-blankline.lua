-- [[ https://github.com/lukas-reineke/indent-blankline.nvim ]]
-- [[ https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/doc/indent_blankline.txt ]]

local config = {
  char = "│",
  char_blankline = "┊",
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
  show_current_context_start_on_current_line = true,
}

require("indent_blankline").setup(config)
