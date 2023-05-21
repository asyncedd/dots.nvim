local ts_input = require("mini.surround").gen_spec.input.treesitter

return {
  mappings = {
    add = "",
    delete = "",
    find = "gzx",
    find_left = "gzX",
    highlight = "gzc",
    replace = "",
    update_n_lines = "",
  },

  n_lines = 500,
  search_method = "cover_or_next",

  custom_surroundings = {
    f = { input = ts_input({ outer = "@function.outer", inner = "@function.inner" }) },
    c = { input = ts_input({ outer = "@comment.outer", inner = "@comment.inner" }) },
    s = { input = ts_input({ outer = "@scope", inner = "@scope.inner" }) },
  },
}
