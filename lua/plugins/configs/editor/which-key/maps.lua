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
    ro = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vio"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select inside blocks, conditionals and loops",
    },
    rc = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vic"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select inside classes",
    },
    rs = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vis"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select inside scopes",
    },
  },
  ["a"] = {
    name = "Around... textobject",
    rf = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vaf"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select around function",
    },
    ro = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vao"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select around blocks, conditionals and loops",
    },
    rc = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vac"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select aruound classes",
    },
    rs = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vas"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "Select around scopes",
    },
  },
}, { mode = "o" })
