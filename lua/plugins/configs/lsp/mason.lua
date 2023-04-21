require("mason").setup()

local mocha = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = mocha.red })
vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = mocha.blue })

require("core.utils.highlight.semantic_tokens")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local mlsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mlsp.setup({
  ensure_installed = {
    "lua_ls",
  },

  automatic_installtion = true,
})

require("core.utils.installPkg")({
  -- "stylua",
})

mlsp.setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      settings = require("lsp.servers.lua_ls"),
    })
  end,
})
