return {
  Lua = {
    runtime = {
      -- Tell the LS (langauge server) that we're using LuaJIT!
      version = "LuaJIT",
      path = {
        vim.split(package.path, ";"),
        "lua/?.lua",
        "lua/?/init.lua",
      },
      pathStrict = false,
    },
    diagnostics = {
      globals = {
        "vim",
      },
      neededFileStatus = {
        ["codestyle-check"] = "Any",
      },
      enable = true,
    },
    completion = {
      displayContext = 100,
      keywordSnippet = "Both",
      workspaceWord = true,
    },
    workspace = {
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        [vim.fn.expand("data" .. "/lazy/lazy.nvim/lua/lazy")] = true,
      },
      checkThirdParty = false,
      MaxPreload = 100000,
      preloadFileSize = 10000,
    },
    telemetry = {
      enable = false,
    },
    format = {
      enable = true,
      -- Put format options here
      -- NOTE: the value should be STRING!!
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
        continuation_indent_size = "2",
      },
    },
    hint = {
      enable = true,
    },
    semantic = {
      enable = true,
      keyword = true,
    },
  },
}
