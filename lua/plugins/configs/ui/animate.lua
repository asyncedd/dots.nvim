local animate = require("mini.animate")

animate.setup({
  cursor = {
    -- Animate for 200 milliseconds with linear easing
    timing = animate.gen_timing.linear({ duration = 200, unit = 'total' }),
  },

  scroll = {
    enable = false,
  },
})
