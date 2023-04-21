return function()
  local nls = require("null-ls")
  local builtins = nls.builtins

  nls.setup({
    sources = {
      builtins.formatting.stylua,
      -- builtins.diagnostics.luacheck,
      -- builtins.diagnostics.selene,
      builtins.diagnostics.todo_comments,
      builtins.diagnostics.trail_space,
      builtins.code_actions.gitsigns,
      -- builtins.completion.luasnip,
    },
  })

  require("mason-null-ls").setup({
    automatic_setup = {},
    automatic_installation = true,
    ensure_installed = {
      "stylua",
      -- "luacheck",
      -- "selene"
    }
  })

  require("mason-null-ls").setup_handlers({})
end

