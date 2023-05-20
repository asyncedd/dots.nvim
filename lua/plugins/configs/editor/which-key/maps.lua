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
          end, { keeppos = true }),
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
          end, { keeppos = true }),
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
          end, { keeppos = true }),
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
          end, { keeppos = true }),
        })
      end,
      "inner scopes",
    },
    mf = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vif"
          end, { keeppos = true }),
        })
      end,
      "inner function",
    },
    mo = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vio"
          end, { keeppos = true }),
        })
      end,
      "inner blocks, conditionals and loops",
    },
    mc = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vic"
          end, { keeppos = true }),
        })
      end,
      "inner classes",
    },
    ms = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vis"
          end, { keeppos = true }),
        })
      end,
      "inner scopes",
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
  ["a"] = {
    name = "Around... textobject",
    rf = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vaf"
          end, { keeppos = true }),
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
          end, { keeppos = true }),
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
          end, { keeppos = true }),
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
          end, { keeppos = true }),
        })
      end,
      "around scopes",
    },
    mf = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vaf"
          end, { keeppos = true }),
        })
      end,
      "around function",
    },
    mo = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vao"
          end, { keeppos = true }),
        })
      end,
      "around blocks, conditionals and loops",
    },
    mc = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vac"
          end, { keeppos = true }),
        })
      end,
      "aruound classes",
    },
    ms = {
      function()
        require("leap").leap({
          target_windows = { vim.fn.win_getid() },
          action = require("leap-spooky").spooky_action(function()
            return "vas"
          end, { keeppos = true }),
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

wk.register({
  ["s"] = {
    name = "Leap",
  },
  ["l"] = {
    name = "LSPSaga",
  },
}, { prefix = "<leader>" })
