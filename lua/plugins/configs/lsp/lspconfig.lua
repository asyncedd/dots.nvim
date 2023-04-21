local icons = require("core.utils.icons.diagnostics")

local mason_lspconfig = require("mason-lspconfig")
local mason = require("mason")
local lspconfig = require("lspconfig")
local neodev = require("neodev")
-- local nullls = require("null-ls")

neodev.setup()

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
  },
  automatic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = require("plugins.configs.lsp.servers.lua_ls")
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
  }
})

-- nullls.setup({
--   sources = {
--     nullls.builtins.formatting.stylua,
--   },
-- })
