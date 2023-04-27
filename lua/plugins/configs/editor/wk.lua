local wk = require("which-key")

wk.setup({
  operators = {
    gc = "Comments",
    gb = "Comments",
  },
  motions = {
    s = "Leap",
    S = "Leap backward",
  },
})

wk.register({
  c = {
    name = "line-comment",
    c = "Line-Comment",
    O = "Add a comment on the line above",
    o = "Add a comment on the line below",
    A = "Add comment at the end of line",
  },
  b = {
    name = "block-comment",
    c = "Block-comment",
  },
}, { prefix = "g" })

wk.register({
  ys = "Add surround",
  yss = "Add surround in at a line",
  yS = "Add the delimiter pair on new lines",
  ySS = "Add the delimiter pair on the new line",
  S = { "Toggle surround in visual mode", mode = { "v", "x" } },
  ds = "Delete surround",
  cs = "Change surround",
})

wk.register({
  s = "Leap",
  S = "Leap backward",
}, { mode = { "n", "v", "o", "x" } })
