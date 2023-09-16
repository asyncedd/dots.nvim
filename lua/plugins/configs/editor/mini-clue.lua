local miniclue = require("mini.clue")
local hints = {}
-- stylua: ignore
local keys = { "b", "h", "P", "p", "y" }
-- stylua: ignore end

for _, br in ipairs({ "[", "]" }) do
  for _, v in ipairs(keys) do
    table.insert(hints, { mode = "n", keys = br .. (v ~= "" and v or br), postkeys = br })
  end
end

return {
  triggers = {
    -- [] triggers
    { mode = "n", keys = "]" },
    { mode = "n", keys = "[" },
    -- Leader triggers
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),

    hints,

    miniclue.gen_clues.windows({
      submode_move = true,
      submode_navigate = true,
      submode_resize = true,
    }),
  },
  window = {
    -- Show window immediately
    delay = 0,
    config = {
      border = "solid",
    },
  },
}
