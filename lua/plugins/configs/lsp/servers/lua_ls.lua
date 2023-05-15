return {
  Lua = {
    runtime = {
      pathStrict = true,
    },
    completion = {
      callSnippet = "Both",
    },
    diagnostics = {
      globals = "vim",
      neededFileStatus = {
        ["codestyle-check"] = "Any",
      },
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
