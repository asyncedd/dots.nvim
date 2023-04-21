local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.luacheck.with({
    extra_args = { "globals vim" },
  }),
  null_ls.builtins.diagnostics.selene,
}

null_ls.setup({ sources = sources })
