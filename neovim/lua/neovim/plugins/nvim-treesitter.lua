-- [[ https://github.com/nvim-treesitter/nvim-treesitter#quickstart ]]

local config = {
  -- [[ nvim-treesitter/nvim-treesitter ]]
  ensure_installed = "all",
  sync_install = false,
  auto_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gs",

      -- Visual Mode
      node_incremental = "gs",
      node_decremental = "gS",
      scope_incremental = "<leader>gc",
    },
  },

  -- [[ https://github.com/nvim-treesitter/playground ]]
  --[[
  playground = {
     enable = true,
     disable = {},
     updatetime = 25,
     persist_queries = false,
  },
  --]]

  -- [[ https://github.com/nvim-treesitter/nvim-treesitter-textobjects ]]
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      include_surrounding_whitespace = false,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["uc"] = "@comment.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
        ["<leader>f"] = "@function.outer",
        ["<leader>e"] = "@element",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
        ["<leader>F"] = "@function.outer",
        ["<leader>E"] = "@element",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = "shadow",
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },

  -- [[ https://github.com/nvim-treesitter/nvim-treesitter-refactor ]]
  refactor = {
    highlight_definitions = {
      enable = true,
    },
    highlight_current_scope = {
      enable = true,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },

  -- [[ https://github.com/windwp/nvim-ts-autotag ]]
  autotag = {
    enable = true,
    skip_tags = {
      "area",
      "base",
      "br",
      "col",
      "command",
      "embed",
      "hr",
      "img",
      "input",
      "keygen",
      "link",
      "meta",
      "param",
      "source",
      "track",
      "wbr",
      "menuitem",
    },
  },
}

require("nvim-treesitter.configs").setup(config)
