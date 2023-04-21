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

vim.schedule(function ()
  -- Load Editor plugins later.
  -- Nonblocking -> {
  --  Comment (modern commentary.vim)
  -- }
  --
  require("plugins.loader.editor")

  require("plugins.loader.cmp_cmd")
end)
