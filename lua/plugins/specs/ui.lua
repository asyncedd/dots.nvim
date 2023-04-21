local colorscheme = require("user.settings.colorscheme")

return {
  -- Colorscheme
  colorscheme,
  -- Indent blanklines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = require("plugins.configs.ui.indentBlankline"),
    event = "BufReadPost",
  },
  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "BufReadPost",
  },
  -- Heirline
  {
    "rebelot/heirline.nvim",
    config = function()
      require("plugins.configs.ui.heirline")
    end,
    event = { "BufReadPost", "VeryLazy" },
  },
  -- Cursorword
  {
    "echasnovski/mini.cursorword",
    config = function()
      require("mini.cursorword").setup()
    end,
    event = "BufReadPost",
  },
  -- Dashboard
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        -- config
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    priority = 1000,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      deb = { icon = "", name = "Deb" },
      lock = { icon = "", name = "Lock" },
      mp3 = { icon = "", name = "Mp3" },
      mp4 = { icon = "", name = "Mp4" },
      out = { icon = "", name = "Out" },
      ["robots.txt"] = { icon = "ﮧ", name = "Robots" },
      ttf = { icon = "", name = "TrueTypeFont" },
      rpm = { icon = "", name = "Rpm" },
      woff = { icon = "", name = "WebOpenFontFormat" },
      woff2 = { icon = "", name = "WebOpenFontFormat2" },
      xz = { icon = "", name = "Xz" },
      zip = { icon = "", name = "Zip" },
    },
  },
}
