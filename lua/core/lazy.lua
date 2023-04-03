local pluginSpec = require("plugins")
local disabledPlugins = require("user.builtinPlugins")

require("lazy").setup({
  pluginSpec
}, {
  performance = {
    rtp = {
      disabled_plugins = disabledPlugins
    },
  },
  install = {
    colorscheme = { "catppuccin" }
  },
  default = {
    lazy = true,
    version = false,
  },
})
