return function()
  local icons = require("core.utils.icons.diagnostics")

  local mason_lspconfig = require("mason-lspconfig")
  local mason = require("mason")
  local lspconfig = require("lspconfig")
  local neodev = require("neodev")
  local masonNullLs = require("mason-null-ls")
  -- local nullls = require("null-ls")

  neodev.setup()

  mason.setup()

  masonNullLs.setup({
    automatic_setup = true,
  })

  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
    },
    automatic_installation = true,
  })

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

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = require("plugins.configs.lsp.servers.lua_ls"),
  })

  for name, icon in pairs(icons) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  end

  vim.diagnostic.config({
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4 },
      severity_sort = true,
    },
  })

  -- nullls.setup({
  --   sources = {
  --     nullls.builtins.formatting.stylua,
  --   },
  -- })
end
