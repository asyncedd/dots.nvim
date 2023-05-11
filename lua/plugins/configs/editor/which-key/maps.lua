local wk = require("which-key")

wk.register({
  ["i"] = {
    name = "inner textobject",
    rf = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vif"
          end, { keeppos = true, on_return = (vim.v.operator == "y") and "p" }),
        })
      end,
      "inner function",
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
      "inner blocks, conditionals and loops",
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
      "inner classes",
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
      "inner scopes",
    },
    riw = "inner word",
    riW = "inner WORD",
    ris = "inner sentence",
    rip = "inner paragraph",
    ["ir["] = 'inner [] from "[" to the matching "]"',
    ["ir]"] = "same as i[",
    ["ir("] = "same as ib",
    ["ir)"] = "same as ib",
    ["irb"] = "inner block from [( to )]",
    ["ir>"] = "same as i<",
    ["ir<"] = 'inner <> from "<" to the matching ">"',
    ["irt"] = "inner tag block",
    ["ir{"] = "same as iB",
    ["ir}"] = "same as iB",
    ["irB"] = "inner Block from [{ to }]",
    ['ir"'] = "double quoted string without the quotes",
    ["ir'"] = "single quoted string without the quotes",
    ["ir`"] = "string in backticks without the backticks",
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
      "around function",
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
      "around blocks, conditionals and loops",
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
      "aruound classes",
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
      "around scopes",
    },
    raw = "inner word",
    raW = "inner WORD",
    ras = "inner sentence",
    rap = "inner paragraph",
    ["ar["] = 'inner [] from "[" to the matching "]"',
    ["ar]"] = "same as i[",
    ["ar("] = "same as ib",
    ["ar)"] = "same as ib",
    ["arb"] = "inner block from [( to )]",
    ["ar>"] = "same as i<",
    ["ar<"] = 'inner <> from "<" to the matching ">"',
    ["art"] = "inner tag block",
    ["ar{"] = "same as iB",
    ["ar}"] = "same as iB",
    ["arB"] = "inner Block from [{ to }]",
    ['ar"'] = "double quoted string without the quotes",
    ["ar'"] = "single quoted string without the quotes",
    ["ar`"] = "string in backticks without the backticks",
  },
}, { mode = "o" })
