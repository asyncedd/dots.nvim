local nls = require("null-ls")

nls.setup({
  sources = {
    nls.builtins.formatting.stylua.with({
      condition = function(utils)
        return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
      end,
    }),
  },
})
