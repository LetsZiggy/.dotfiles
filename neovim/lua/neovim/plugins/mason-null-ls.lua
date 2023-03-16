-- [[ https://github.com/jayp0521/mason-null-ls.nvim ]]
-- [[ https://github.com/jayp0521/mason-null-ls.nvim#available-null-ls-sources ]]
-- [[ https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md ]]

-- local null_ls = require("null-ls")
-- local code_actions = null_ls.builtins.code_actions
-- local completion = null_ls.builtins.completion
-- local diagnostics = null_ls.builtins.diagnostics
-- local formatting = null_ls.builtins.formatting
-- local hover = null_ls.builtins.hover

local config = {
  automatic_installation = true,
  automatic_setup = true,
}

local handlers = {
  function(source_name, methods)
    require("mason-null-ls.automatic_setup")(source_name, methods)
  end,
}

require("mason-null-ls").setup(config)
require("mason-null-ls").setup_handlers(handlers)
