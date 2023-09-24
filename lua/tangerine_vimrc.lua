-- :fennel:1695596246
local define_sign = vim.fn.sign_define
for name, icon in pairs(dots.UI.icons.LSP.diagnostics) do
  local name0 = ("DiagnosticSign" .. name)
  define_sign(name0, {text = icon, texthl = name0, numhl = ""})
end
return nil