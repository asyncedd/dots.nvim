local colors

if vim.g.colorscheme == "catppuccin" then
  colors = require("catppuccin.palettes").get_palette()
elseif vim.g.colorscheme == "tokyonight" then
  colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
end

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
