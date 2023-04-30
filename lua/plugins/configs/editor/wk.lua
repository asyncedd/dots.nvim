local wk = require("which-key")

wk.register({
  f = {
    name = "Find",
    f = "File",
    b = "File Browser",
    g = "Grep",
    h = "Help tags",
    m = "Menu",
  },
}, { prefix = "<leader>" })

wk.register({
  s = "Leap forward to",
  S = "Leap backwards to",
}, { mode = { "o", "n" }, prefix = "" })

wk.register({
  x = "Leap foward to",
  X = "Leap backwards to",
}, { mode = { "o", "x" }, prefix = "" })

