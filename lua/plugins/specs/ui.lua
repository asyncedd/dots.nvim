local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "folke/noice.nvim",
    config = function()
      require("ui.noice")
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
  },
  {
    "glepnir/dashboard-nvim",
    config = true,
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "BufReadPre",
  },
  {
    "rebelot/heirline.nvim",
    init = lazyLoad("heirline.nvim"),
    config = function()
      require("ui.heirline")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = true,
    init = lazyLoad("indent-blankline.nvim"),
  },
  {
    {
      "catppuccin/nvim",
      config = function()
        require("ui.catppuccin")
      end,
    },
    "FrenzyExists/aquarium-vim",
    {
      "wuelnerdotexe/vim-enfocado",
      config = function()
        vim.g.enfocado_style = "nature" -- You can go for "neon" too.
      end,
    },
    {
      "folke/tokyonight.nvim",
      config = function()
        require("ui.tokyonight")
      end,
    },
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("ui.kanagawa")
      end
    },
  },
}
