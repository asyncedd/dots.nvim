local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "catppuccin/nvim",
    config = function()
      require("plugins.configs.ui.catppuccin")
    end,
  },
  {
    "echasnovski/mini.map",
    config = function()
      require("plugins.configs.ui.map")
    end,
    init = lazyLoad("mini.map"),
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.configs.ui.blankline")
    end,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("plugins.configs.ui.indentscope")
    end,
    init = lazyLoad("mini.indentscope"),
  },
  {
    "folke/noice.nvim",
    config = true,
    init = lazyLoad("noice.nvim"),
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}

