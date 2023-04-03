local nls = require("null-ls")
local builtins = nls.builtins

nls.setup({
  sources = {
    builtins.formatting.stylua,
    builtins.diagnostics.luacheck.with({
      extra_args = { "--globals vim" },
    }),
  },
})
