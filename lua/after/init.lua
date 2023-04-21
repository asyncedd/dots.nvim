local o = vim.opt

local icons = require("core.utils.icons")

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

-- Enable clipboard :)
o.clipboard = "unnamedplus,unnamed"
-- Enable cool undos :)
o.undofile = true
-- Enable undo levels
o.undolevels = 10000
-- Enable more undo stuff
o.undoreload = 10000
