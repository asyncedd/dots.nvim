local ai = require("mini.ai")

ai.setup({
  custom_textobjects = {
    -- Tweak argument textobject
    a = ai.gen_spec.argument({
      brackets = { "%b()" },
      separator = ";",
    }),

    -- Disable brackets alias in favor of builtin block textobject
    -- b = false,

    -- Now `vax` should select `xxx` and `vix` - middle `x`
    x = { "x()x()x" },

    -- Whole buffer
    g = function()
      local from = { line = 1, col = 1 }
      local to = {
        line = vim.fn.line("$"),
        col = math.max(vim.fn.getline("$"):len(), 1),
      }
      return { from = from, to = to }
    end,

    -- Make `|` select both edges in non-balanced way
    ["|"] = ai.gen_spec.pair("|", "|", { type = "non-balanced" }),

    -- Make " " select spcaes.
    [" "] = ai.gen_spec.pair(" ", " "),
    ["*"] = ai.gen_spec.pair("*", "*", { type = "greedy" }),
    ["_"] = ai.gen_spec.pair("_", "_", { type = "greedy" }),
  },
})
