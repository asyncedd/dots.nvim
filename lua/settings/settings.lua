local M = {}

-- It can be catppuccin, tokyonight, or onedarkpro
M.colorscheme = "catppuccin"

M.tokyonight = {
  -- Storm, Night, Moon or Day
  style = "moon",
}

M.abbr = {
  I = {
    ["return"] = {
      "retu",
      "retn",
      "retun",
      "retrun",
      "returb",
      "retunr",
      "retunrn",
      "retunr",
      "rerturn",
      "rreturn",
      "reutrn",
      "retrn",
    },
    ["local"] = {
      "locl",
      "locla",
      "locak",
      "loal",
      "locall",
      "llocal",
      "lcoal",
      "loacl",
      "loacl",
    },
    ["const"] = {
      "cons",
      "cont",
    },
    ["print"] = {
      "prin",
      "pritn",
      "prnit",
      "pirnt",
      "prinr",
      "pront",
      "priht",
      "prnt",
      "prinnt",
    },
  },
  C = {
    ["wqa"] = {
      "Wqa",
      "WQA",
      "wQa",
      "wqA",
      "qaw",
      "aqw",
      "QaW",
      "QAW",
      "AQW",
      "aQw",
      "aqW",
    },
  },
}

return M
