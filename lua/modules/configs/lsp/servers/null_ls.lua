return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        DiagnosticSign = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
        underline = true,
        update_in_insert = false,
        virutal_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      workspace = {
        workspace = {
          checkThirdParty = false
        }
      },
      completion = {
        workspaceWord = true,
        callSnippet = "Both",
      },
    }
  }
}
