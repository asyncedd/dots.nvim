local ai = require("mini.ai")

return {
  n_lines = 500,
  custom_textobjects = {
    o = ai.gen_spec.treesitter({
      a = { "@block.outer", "@conditional.outer", "@loop.outer" },
      i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    }, {}),
    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    c = ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),
    s = ai.gen_spec.treesitter({ a = "@scope", i = "@scope.inner" }, {}),
  },
  search_method = "cover_or_nearest",
}
