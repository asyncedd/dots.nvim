local mocha = require("catppuccin.palettes").get_palette("mocha")

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = mocha.text })

require("mini.indentscope").setup({
  symbol = "│",
  options = {
    try_as_border = true,
  },
  draw = {
    animation = require("mini.indentscope").gen_animation.quadratic({ easing = "out", duration = 100, unit = "total" }),
  },
})
