return {
  Lua = {
    runtime = {
      pathStrict = true,
    },
    completion = {
      callSnippet = "Replace",
      keywordSnippet = "Replace",
      postfix = "@",
    },
    workspace = {
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
      },
      maxPreload = 100000,
      preloadFileSize = 10000,
      checkThirdParty = false,
    },
  },
}
