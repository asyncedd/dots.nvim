local status, indent_blankline = pcall(require, "indent_blankline")
if not status then return end

indent_blankline.setup({
  -- show_current_context = true,
  -- show_current_context_start = true,
  show_end_of_line = true,
  space_char_blankline = " ",
  -- show_trailing_blankline_indent = true,
})

require("mini.indentscope").setup({
  symbol = "│",
})
