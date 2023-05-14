local capabilities = vim.lsp.protocol.make_client_capabilities()
local mason_reg = require("mason-registry")

local codelldb = mason_reg.get_package("codelldb")
local ex_path = codelldb:get_install_path() .. "/extension/"

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

return {
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      ex_path .. "adapter/codelldb",
      ex_path .. "lldb/lib/liblldb.dylib"
    ),
  },
  server = {
    capabilities = capabilities,
    on_attach = function()
      require("rust-tools").inlay_hints.enable()
    end,
  },
  hover_actions = {
    auto_focus = false,
  },
}
