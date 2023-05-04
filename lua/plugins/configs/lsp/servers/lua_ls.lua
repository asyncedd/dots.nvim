return {
  Lua = {
    runtime = {
      pathStrict = true,
    },
    completion = {
      callSnippet = "Both",
      workspace = true,
      keywordSnippet = "Replace",
      postfix = "@",
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
    format = {
      enable = true,
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
        continuation_indent_size = "2",
      },
    },
  },
}
