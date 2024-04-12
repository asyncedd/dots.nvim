local M = {}

M.ui = {
  theme = "onedark",
  statusline = {
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "diagnostics",
      "cwd",
      "cursor",
    },
  },
}

return M
