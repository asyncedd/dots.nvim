local nls = require("null-ls")

nls.setup({
  sources = {
    nls.builtins.formatting.stylua,
  },
})
