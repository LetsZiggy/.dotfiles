-- [[ https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt ]]

local config = {
  open_on_setup = true,
  sort_by = "extension",
  view = {
    width = 30,
    centralize_selection = true,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_opened_files = "name",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = true,
    },
    special_files = {
      "Cargo.toml",
      "Makefile",
      "README.md",
      "readme.md",
    },
  },
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
  },
  filters = {
    custom = {},
  },
  git = {
    ignore = false,
  },
  actions = {
    change_dir = {
      enable = true,
    },
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
}

require("nvim-tree").setup(config)
