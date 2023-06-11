local M = {}

M.ultimate = {
  space = {
    enable = true,
  },
  space2 = {
    enable = true,
  },
  bs = {
    enable = true,
    space = "balance",
    indent_ignore = true,
  },
  cr = {
    enable = false,
  },
}

M.autopairs = {
  map_bs = false,
  map_cr = true,
}

return M
