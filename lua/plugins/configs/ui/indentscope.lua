local indentScope = require("mini.indentscope")

indentScope.setup({
  draw = {
    animation = indentScope.gen_animation.exponential({
      easing = "in-out",
    }),
  },
  symbol = "│",
  options = {
    try_as_border = true,
  },
})
