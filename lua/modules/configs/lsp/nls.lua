return function()
  local nls = require("null-ls")
  nls.setup({
    sources = {
      nls.builtins.code_actions.gitsigns,
      nls.builtins.formatting.stylua,
    },
  })
end
