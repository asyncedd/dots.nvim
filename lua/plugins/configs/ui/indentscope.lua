local colorscheme = vim.g.colorscheme
local colors

if colorscheme == "catppuccin" then
  colors = require("catppuccin.palettes").get_palette()
elseif colorscheme == "tokyonight" then
  colors = require("tokyonight.colors").setup() -- pass in any of the config options as explained above
end

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = colors.text })

require("mini.indentscope").setup({
  symbol = "│",
  options = {
    try_as_border = true,
  },
  draw = {
    animation = require("mini.indentscope").gen_animation.quadratic({ easing = "out", duration = 100, unit = "total" }),
  },
})
