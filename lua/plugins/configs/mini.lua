require("mini.cursorword").setup()

require("mini.splitjoin").setup()

require("mini.surround").setup({
  mappings = {
    add = "<leader>sa",
    delete = "<leader>sd",
    find = "<leader>sf",
    find_left = "<leader>sF",
    highlight = "<leader>sh",
    replace = "<leader>sr",
    update_n_lines = "<leader>sn",

    suffix_last = "l",
    suffix_next = "n",
  },
  hooks = {
    pre = function()
      require("ts_context_commentstring.internal").update_commentstring({})
    end,
  },
})

require("mini.ai").setup()

require("mini.indentscope").setup({
  symbol = "│",
  options = {
    try_as_border = true,
  },
})

require("mini.comment").setup()

require("mini.move").setup()

local map = require("mini.map")
local integration = map.gen_integration

map.setup({
  integrations = {
    integration.builtin_search(),
    integration.gitsigns(),
    integration.diagnostic(),
  },
})

map.toggle()

require("mini.animate").setup()
