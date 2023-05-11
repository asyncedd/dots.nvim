local wk = require("which-key")

wk.register({
  [","] = {
    name = "Local leader",
    j = "Jump to Treesitter nodes.",
  },
}, {
  mode = { "n", "x", "o" },
})

wk.register({
  ["i"] = {
    name = "Inside... textobject",
    rf = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vif"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select inside function",
    },
  },
  ["a"] = {
    name = "Inside... textobject",
    rf = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vaf"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select inside function",
    },
  },
}, { mode = "o" })
