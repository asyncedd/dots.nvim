local wk = require("which-key")

wk.register({
  [","] = {
    name = "Local leader",
    j = "Jump to Treesitter nodes.",
  },
}, {
  mode = { "n", "x", "o" },
})
