return {
  Lua = {
    runtime = {
      -- Let the server know, that we're using LuaJIT.
      version = "LuaJIT",
    },
    completion = {
      -- Show both function name and context.
      callSnippet = "Both",
      -- Offer completion for both keyword and snippet.
      keywordSnippet = "Both",
    },
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = {
        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
      checkThirdParty = false,
    },
  },
}
