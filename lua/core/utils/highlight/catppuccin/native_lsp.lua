local ctp = require("catppuccin.palettes").get_palette()
local hl = vim.api.nvim_set_hl

vim.api.nvim_set_hl("LspDiagnosticsUnderlineError", { style = underlines.errors, sp = error }, -- Used to underline "Error" diagnostics
LspDiagnosticsUnderlineWarning = { style = underlines.warnings, sp = warning }, -- Used to underline "Warning" diagnostics
LspDiagnosticsUnderlineInformation = { style = underlines.information, sp = info }, -- Used to underline "Information" diagnostics
LspDiagnosticsUnderlineHint = { style = underlines.hints, sp = hint }, -- Used to underline "Hint" diagnostics

