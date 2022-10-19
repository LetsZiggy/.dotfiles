-- [[ https://github.com/jayp0521/mason-null-ls.nvim ]]
-- [[ https://github.com/jayp0521/mason-null-ls.nvim#available-null-ls-sources ]]

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
