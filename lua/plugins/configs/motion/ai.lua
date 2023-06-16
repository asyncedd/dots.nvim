local ai = require("mini.ai")

return {
  n_lines = 500,
  custom_textobjects = {
    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    c = ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),
    s = ai.gen_spec.treesitter({ a = "@scope", i = "@scope.inner" }, {}),
    [","] = ai.gen_spec.argument(),
  },
  search_method = "cover_or_next",
}
