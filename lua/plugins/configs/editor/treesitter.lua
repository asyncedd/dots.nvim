require("nvim-treesitter.configs").setup({
  -- Automagically install parsers when needed.
  auto_install = true,

  -- Enable treesitter's highlighting.
  highlight = {
    enable = true,
    use_language_tree = true,
  },

  incremental_selection = {
    enable = false,
  },
})

