local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "catppuccin/nvim",
    config = function()
      require("ui.catppuccin")
    end,
  },
  {
    "echasnovski/mini.map",
    config = function()
      vim.schedule_wrap(function()
        require("ui.map")
      end)
    end,
    init = lazyLoad("mini.map"),
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ui.blankline")
    end,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("ui.indentscope")
    end,
    init = lazyLoad("mini.indentscope"),
  },
  {
    "folke/noice.nvim",
    config = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}

