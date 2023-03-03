local icons = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

return function()

  local status, mason_lspconfig = pcall(require, "mason-lspconfig")
  local status1, mason = pcall(require, "mason")
  local status2, lspconfig = pcall(require, "lspconfig")
  if (not status) then return end
  if (not status1) then return end
  if (not status2) then return end

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

end
