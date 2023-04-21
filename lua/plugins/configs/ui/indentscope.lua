require("mini.indentscope").setup({
  symbol = "│",
  options = {
    try_as_border = true,
  },
  draw = {
    animation = require("mini.indentscope").gen_animation.quadratic({ easing = "out", duration = 100, unit = "total" }),
  },
})
