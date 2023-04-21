local tools = {}

tools["nvim-telescope/telescope.nvim"] = {
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },
  -- keys = require("tools.telescope_keymaps"),
  event = "VeryLazy"
}

return tools
