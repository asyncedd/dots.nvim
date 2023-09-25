vim.loader.enable()

require("settings")
require("settings.options")
require("settings.keymap")
require("settings.autocmd")

require("plugins")
require("hotpot")

require("lsp.diagnostics")

vim.cmd("colorscheme " .. (vim.g.vscode and "habamax" or dots.UI.colorscheme.name))
