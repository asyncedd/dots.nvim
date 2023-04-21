local builtin = require("statuscol.builtin")

require("statuscol").setup({
  segments = {
    {
      text = { builtin.foldfunc },
      click = "v:lua.ScFa",
    },
    {
      sign = {
        name = { "Diagnostic" },
        maxwidth = 2,
        auto = true,
      },
      click = "v:lua.ScSa",
    },
    {
      sign = {
        name = { ".*" },
        maxwidth = 2,
        colwidth = 1,
        auto = true,
      },
      click = "v:lua.ScSa",
    },
    {
      text = { builtin.lnumfunc },
      click = "v:lua.ScLa",
      colwidth = 2,
    },
  },
})
