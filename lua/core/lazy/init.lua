local pluginSpec = require("core.lazy.plugins")
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
  }
})
