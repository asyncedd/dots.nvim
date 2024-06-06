local conf = require("nvconfig").ui.lsp
local map = vim.keymap.set
local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

  map("n", "<leader>ra", function()
    require("nvchad.lsp.renamer")()
  end, opts("NvRenamer"))

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map("n", "gr", vim.lsp.buf.references, opts("Show references"))

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

local on_init = function(client, _)
  if client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

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

local lspconfig = require("lspconfig")

local servers = {
  "nixd",
  -- "clangd",
  -- "svelte",
  -- "emmet_ls",
  -- "tailwindcss",
  -- "marksman",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

require("lspconfig")["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      check = {
        command = "clippy",
        allFeatures = true,
        extraArgs = {
          "--",
          "-W clippy::pedantic",
          "-W clippy::nursery",
          "-W clippy::unwrap_used",
          "-W clippy::expect_used",
        },
      },
      procMacro = {
        enable = true,
        ignored = {
          ["async-trait"] = { "async_trait" },
          ["napi-derive"] = { "napi" },
          ["async-recursion"] = { "async_recursion" },
        },
      },
    },
  },
})

require("lspconfig")["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
  settings = {
    Lua = {
      hint = {
        enable = true,
        arrayIndex = "Disable",
      },
      runtime = {
        pathStrict = true,
      },
      completion = {
        callSnippet = "Both",
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
      workspace = {
        maxPreload = 100000,
        preloadFileSize = 10000,
        checkThirdParty = false,
      },
    },
  },
})

require("lspconfig")["cssls"].setup({
  capabilities = capabilities,
  cmd = { "css-languageserver", "--stdio" },
  on_attach = on_attach,
  on_init = on_init,
})
