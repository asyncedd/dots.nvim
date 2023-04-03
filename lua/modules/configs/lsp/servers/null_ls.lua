local runtime = vim.api.nvim_get_runtime_file

return {
  Lua = {
    diagnostics= {
      globals = { "vim" },
    },
    workspace = {
      checkThirdParty = false,
      library = runtime("", true)
    },
    completion = {
      workspaceWord = true,
      callSnippet = "Both",
    },
  },
}
