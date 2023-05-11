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
    rw = "inner word",
    rW = "inner WORD",
    rp = "inner paragraph",
    ["r["] = 'inner [] from "[" to the matching "]"',
    ["r]"] = "same as i[",
    ["r("] = "same as ib",
    ["r)"] = "same as ib",
    ["rb"] = "inner block from [( to )]",
    ["r>"] = "same as i<",
    ["r<"] = 'inner <> from "<" to the matching ">"',
    ["rt"] = "inner tag block",
    ["r{"] = "same as iB",
    ["r}"] = "same as iB",
    ["rB"] = "inner Block from [{ to }]",
    ['r"'] = "double quoted string without the quotes",
    ["r'"] = "single quoted string without the quotes",
    ["r`"] = "string in backticks without the backticks",
  },
}, { mode = "o" })
