return function()
  local nls = require("null-ls")

  nls.setup({
    sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.diagnostics.luacheck,
      nls.builtins.diagnostics.selene,
    },
  })

  require("mason-null-ls").setup({
    automatic_setup = {},
  })

  require("mason-null-ls").setup_handlers({})
end
