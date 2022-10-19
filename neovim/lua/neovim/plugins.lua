-- [[ https://github.com/wbthomason/packer.nvim#bootstrapping ]]

local fn = vim.fn

local ensure_packer = function()
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) == 1 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()
local packer = require("packer")

packer.init({
  auto_clean = false,
})

packer.reset()

return packer.startup(function(use)
    -- ------------------------------- --
    -- --------Package Manager-------- --
    -- ------------------------------- --

    use({"wbthomason/packer.nvim"})

    -- ------------------------------- --
    -- --------Neovim Helpers--------- --
    -- ------------------------------- --

    use({"nvim-lua/plenary.nvim"})

    use({"lewis6991/impatient.nvim"})

    -- ------------------------------- --
    -- ------------Icons-------------- --
    -- ------------------------------- --

    use({
      "nvim-tree/nvim-web-devicons",
      config = function() require("nvim-web-devicons").setup() end,
    })

    -- ------------------------------- --
    -- ---------ColourSchemes--------- --
    -- ------------------------------- --

    if fn.has("termguicolors") == 1 then
      use({"folke/tokyonight.nvim"})
    end

    -- ------------------------------- --
    -- ----------Statusline----------- --
    -- ------------------------------- --

    if fn.has("termguicolors") == 1 then
      use({
        "nvim-lualine/lualine.nvim",
        requires = {
          {"nvim-tree/nvim-web-devicons", opt = true},
        },
        event = "CursorHold",
        config = function() require("neovim.plugins.lualine") end,
      })

      use({
        "j-hui/fidget.nvim",
        config = function() require("neovim.plugins.fidget") end,
      })
    end

    -- ------------------------------- --
    -- ------------Editor------------- --
    -- ------------------------------- --

    use({
      "norcalli/nvim-colorizer.lua",
      event = "CursorHold",
      config = function() require("colorizer").setup() end,
    })

    use({"gpanders/editorconfig.nvim"})

    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function() require("neovim.plugins.indent-blankline") end,
    })

    use({
      "wellle/targets.vim",
      event = "BufRead",
    })

    -- ------------------------------- --
    -- ------------Syntax------------- --
    -- ------------------------------- --

    use({
      "nvim-treesitter/nvim-treesitter",
      event = "CursorHold",
      run = ":TSUpdate",
      config = function() require("neovim.plugins.nvim-treesitter") end,
    })

    use({"nvim-treesitter/nvim-treesitter-context"})

    use({"nvim-treesitter/nvim-treesitter-textobjects"})

    use({"nvim-treesitter/nvim-treesitter-refactor"})

    use({
      "nvim-treesitter/playground",
      disable = true,
    })

    use({
      "numToStr/Comment.nvim",
      config = function() require("Comment").setup() end,
    })

    use({"windwp/nvim-ts-autotag"})

    use({
      "Raimondi/delimitMate", -- jiangmiao/auto-pairs
      config = function() require("neovim.plugins.delimitMate") end,
    })

    -- ------------------------------- --
    -- --------------Git-------------- --
    -- ------------------------------- --

    use({
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = function() require("neovim.plugins.gitsigns") end,
    })

    use({
      "rhysd/git-messenger.vim",
      event = "BufRead",
      config = function() require("neovim.plugins.git-messenger") end,
    })

    -- ------------------------------- --
    -- ------Navigation | Search------ --
    -- ------------------------------- --

    use({
      "nvim-tree/nvim-tree.lua",
      requires = {
        {"nvim-tree/nvim-web-devicons", opt = true},
      },
      event = "CursorHold",
      config = function() require("neovim.plugins.nvim-tree") end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-tree/nvim-web-devicons", opt = true},
      },
      event = "CursorHold",
      config = function() require("neovim.plugins.telescope") end,
    })

    use({
      "nvim-telescope/telescope-file-browser.nvim",
      after = {"telescope.nvim"},
      config = function() require("telescope").load_extension("file_browser") end,
    })

    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      after = {"telescope.nvim"},
      run = "make",
      config = function() require("telescope").load_extension("fzf") end,
    })

    use({
      "nvim-telescope/telescope-symbols.nvim",
      after = {"telescope.nvim"},
    })

    -- ------------------------------- --
    -- -------Code completion--------- --
    -- ------------------------------- --

    use({"onsails/lspkind.nvim"})

    use({
      "hrsh7th/cmp-nvim-lua",
      disable = true,
    })

    use({"hrsh7th/cmp-nvim-lsp"})

    use({"hrsh7th/cmp-path"})

    use({"hrsh7th/cmp-buffer"})

    use({"hrsh7th/cmp-cmdline"})

    use({"hrsh7th/cmp-nvim-lsp-document-symbol"})

    use({"hrsh7th/cmp-nvim-lsp-signature-help"})

    use({"L3MON4D3/LuaSnip"})

    use({
      "saadparwaiz1/cmp_luasnip",
      after = {"LuaSnip"},
    })

    use({
      "hrsh7th/nvim-cmp",
      after = {"lspkind.nvim", "cmp_luasnip"},
      event = "InsertEnter",
      config = function() require("neovim.plugins.nvim-cmp") end,
    })

    use({
      'rafamadriz/friendly-snippets',
      config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    })

    -- ------------------------------- --
    -- -------------LSP--------------- --
    -- ------------------------------- --

    use({"neovim/nvim-lspconfig"})

    use({
      "williamboman/mason.nvim",
      after = {"nvim-lspconfig"},
      config = function() require("neovim.plugins.mason") end,
    })

    use({
      "williamboman/mason-lspconfig.nvim",
      after = {"nvim-lspconfig", "mason.nvim"},
      config = function() require("neovim.plugins.mason-lspconfig") end,
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function() require("null-ls").setup() end,
    })

    use({
      "jayp0521/mason-null-ls.nvim",
      after = {"null-ls.nvim", "mason.nvim"},
      config = function() require("neovim.plugins.mason-null-ls") end,
    })

    -- ------------------------------- --
    -- ---------PACKER SYNC----------- --
    -- ------------------------------- --

    if packer_bootstrap then
      require("packer").sync()
    end
end)
