return function()
  require("indent_blankline").setup({
    show_end_of_line = true,
    space_char_blankline = " ",
    user_treesitter = true,
    enabled = true,
    colored_indent_levels = false,
  })
end
