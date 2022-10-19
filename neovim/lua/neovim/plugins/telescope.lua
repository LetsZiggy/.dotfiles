-- [[ https://github.com/nvim-telescope/telescope.nvim ]]

local actions = require("telescope.actions")


local config = {
  defaults = {
    prompt_prefix = " ❯ ",
    initial_mode = "insert",
    sorting_strategy = "ascending",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--trim",
      "--glob-case-insensitive",
      "--glob '!.git/'",
      "--glob '!node_modules/'",
      "--glob '!venv/'",
      "--glob '!*.{db,jpg,jpeg,png,gif}'",
    },
    layout_config = {
      prompt_position = "top",
    },
    pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob-case-insensitive",
          "--glob '!.git/'",
          "--glob '!node_modules/'",
          "--glob '!venv/'",
          "--glob '!*.{db,jpg,jpeg,png,gif}'",
        },
        hidden = true,
      },
      file_browser = {
        hidden = true,
      },
    },
    mappings = {
      n = {
        ["<M-h>"] = actions.which_key,
      },
      i = {
        ["<M-h>"] = actions.which_key,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

require("telescope").setup(config)
