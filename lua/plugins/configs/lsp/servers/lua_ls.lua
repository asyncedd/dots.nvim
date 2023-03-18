local M = {
  Lua = {
    runtime = {
      -- Tell the LS (langauge server) that we're using LuaJIT!
      version = "LuaJIT",
      path = {
        vim.split(package.path, ";"),
        "lua/?.lua",
        "lua/?/init.lua",
      },
    },
    hover = {
      previewFields = vim.o.lines * 4,
    },
    completion = {
      -- Show function name and call the Snippet
      callSnippet = "Replace",
      -- Should the displayed context word contains the content of another file in the workspace
      workspaceWord = true,
    },
    workspace = {
      -- Don't check for third party workspaces.
      checkThirdParty = false,
      -- Make the LS (langauge sever) aware of Neovim runtime files.
      library = {
        vim.api.nvim_get_runtime_file("", true),
        [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
      },
      -- "Cache" files for fast loading.
      -- Oh yeah we allow 100 MB of cache. No more than that.
      -- And we skip files that are over 10MB.
      maxPreload = 100000,
      preloadFileSize = 10000,
    },
    -- Disable the opt-in telemtry. Even though it's opt-in.
    telemetry = {
      enable = false,
    },
    -- Get the LS (language server) to reconize the "vim" global.
    globals = {
      "vim",
    },
  },
}

return M
