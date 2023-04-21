local indentScope = require("mini.indentscope")

indentScope.setup({
  draw = {
    animation = indentScope.gen_animation.cubic(),
  },
  symbol = "│",
  options = {
    try_as_border = true,
  },

  mappings = {
    -- Textobjects
    object_scope = "<leader>ii",
    object_scope_with_border = "<leader>ai",

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = "[i",
    goto_bottom = "]i",
  },
})
