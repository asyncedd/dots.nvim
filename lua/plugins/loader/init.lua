-- lua/plugins/loader/init.lua
-- The command center for loading plugins.

-- Load UI plugins first.
-- What we load from it:
-- Catppuccin (colroscheme) ->
-- Treesitter (syntax highlighting) ->
-- Nonblocking -> {
--  Colorizer (colorizer) + Heirline (statusline)
--  CCC.nvim (color code visualizer)
--  mini.cursorword (Word under cursor highlighter)
--  indent-blankline + mini.indentscope (Indent visualizers)
-- }
--
require("plugins.loader.ui")

-- Setting some funny LSP stuff.

require("plugins.loader.lsp")

-- Non blocking in a vim.schedule function.
-- Load Editor plugins later.
-- Nonblocking -> {
--  Comment (modern commentary.vim)
-- }
--
require("plugins.loader.editor")

-- Completion for the command line.

require("plugins.loader.cmp_cmd")

-- Setting up a autocmd to load nvim-cmp once the user enters insert mode.

require("plugins.loader.cmp")
