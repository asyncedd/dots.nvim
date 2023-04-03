local o = vim.opt

local icons = require("core.utils.icons.diagnostics")

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

require("user.keymaps")
o.clipboard = "unnamedplus,unnamed"
o.undofile = true

