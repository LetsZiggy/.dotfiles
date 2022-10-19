-- [[ https://github.com/hrsh7th/nvim-cmp ]]
-- [[ https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip ]]

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local lspkind = require("lspkind")
local luasnip = require("luasnip")
local cmp = require("cmp")
local config = {
  completion = {
    keyword_length = 1,
  },
  experimental = {
    ghost_text = true,
  },
  -- [[ https://github.com/onsails/lspkind.nvim#option-2-nvim-cmp ]]
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      -- maxwidth = 50,
      -- ellipsis_char = "...",
      before = function (entry, vim_item)
        return vim_item
      end,
    })
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    -- [[ https://github.com/hrsh7th/cmp-nvim-lua ]]
    -- {name = "nvim_lua"},
    -- [[ https://github.com/hrsh7th/cmp-nvim-lsp ]]
    {name = "nvim_lsp"},
    -- [[ https://github.com/hrsh7th/cmp-path ]]
    {name = "path"},
    -- [[ https://github.com/hrsh7th/cmp-buffer ]]
    {name = "buffer"},
    -- [[ https://github.com/hrsh7th/cmp-cmdline ]]
    {name = "cmdline"},
    -- [[ https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol ]]
    {name = "nvim_lsp_document_symbol"},
    -- [[ https://github.com/hrsh7th/cmp-nvim-lsp-signature-help ]]
    {name = "nvim_lsp_signature_help"},
    -- [[ https://github.com/saadparwaiz1/cmp_luasnip ]]
    {name = "luasnip"},
  },
  mapping = {
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-3), {"i", "c"}),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(3), {"i", "c"}),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ["<CR>"] = cmp.mapping.confirm({select = true}),

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
  },
}

require("cmp").setup(config)

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({"/", "?"}, {
  -- mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = "buffer"}
  }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  -- mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = "path"}
  }, {
    {name = "cmdline"}
  })
})
