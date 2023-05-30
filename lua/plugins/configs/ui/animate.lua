local animate = require("mini.animate")

return {
  resize = {
    timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
  },
}
