local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.completion.spell,
}

null_ls.setup({ sources = sources })

