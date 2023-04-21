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
    opts = {
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " Apps",
            group = "DiagnosticHint",
            action = "Telescope app",
            key = "a",
          },
          {
            desc = " dotfiles",
            group = "Number",
            action = "Telescope dotfiles",
            key = "d",
          },
        },
      },
    },
    config = true,
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "BufReadPost",
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
      end,
    },
  },
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      vim.schedule(function()
        require("drop").setup()
      end)
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = true,
    event = "VeryLazy",
    cmds = {
      "ZenMode",
      "close",
      "quit",
    },
    dependencies = {
      {
        "folke/twilight.nvim",
      },
    },
  },
}
