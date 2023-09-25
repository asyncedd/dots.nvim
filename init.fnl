(local define-sign vim.fn.sign_define)

(each [name icon (pairs dots.UI.icons.LSP.diagnostics)]
  (local name (.. "DiagnosticSign" name))
  (define-sign name {:text icon :texthl name :numhl ""}))
