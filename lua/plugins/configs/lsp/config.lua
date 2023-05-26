local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument = {
  completion = {
    completionItem = {
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
    },
  },
  foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  },
  inlayHint = true,
}

local servers = {
  lua_ls = {
    settings = require("plugins.configs.lsp.servers.lua_ls"),
  },
  rust_analyzer = {
    settings = require("plugins.configs.lsp.servers.rust-analyzer"),
  },
  cssls = {},
  jsonls = {},
  tailwindcss = {},
}


for server, server_opts in pairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,

    settings = server_opts.settings,
  })
end
