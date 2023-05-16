local M = {}

M.upair = {
  space = {
    enable = true,
  },
  space2 = {
    enable = true,
  },
  internal_pairs = {
    {
      "'",
      "'",
      suround = true,
      rules = {
        { "when", { "option", "lisp" }, { "not", { "regex", "^%s*$" } }, { "instring" } },
      },
      alpha = true,
      nft = {
        "tex",
      },
      string = true,
    },
  },
}

return M
