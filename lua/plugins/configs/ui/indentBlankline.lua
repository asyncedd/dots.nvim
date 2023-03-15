return function()
  require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
    use_treesitter = true,
    show_trailing_blankline_indent = true,
  })
end
