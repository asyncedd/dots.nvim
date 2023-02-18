local tools = {}

tools["nvim-telescope/telescope.nvim"] = {
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },
  -- keys = require("tools.telescope_keymaps"),
  event = "VeryLazy"
}

tools["nvim-tree/nvim-tree.lua"] = {
  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  },
  config = require("tools.nvimtree"),
  event = "VeryLazy"
}

return tools
