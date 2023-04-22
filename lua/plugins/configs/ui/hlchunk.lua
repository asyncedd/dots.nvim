local colors = require("catppuccin.palettes").get_palette()

require("hlchunk").setup({
  chunk = {
    style = colors.pink,
  },

  indent = {
    enable = true,
    use_treesitter = true,
  },

  blank = {
    enable = false,
  },

  line_num = {
    enable = true,
    style = colors.pink,
  },
})
