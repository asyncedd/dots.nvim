local o = vim.opt

local M = {}

M.icons = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

for name, icon in pairs(M.icons) do
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

return M
