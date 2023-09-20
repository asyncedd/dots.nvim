local M = {}

M.UI = {
  icons = {
    LSP = {
      diagnostics = {
        Error = " ",
        Warn = " ",
        Hint = "󰌵 ",
        Info = " ",
      },
    },
    buffers = {
      readonly = "󰌾 ",
      modified = "● ",
      unsaved_others = "○ ",
    },
  },
}

_G.dots = M

return M
