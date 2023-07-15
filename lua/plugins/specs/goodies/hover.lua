return not dots.goodies.hover.type and {}
  or {
    {
      "Fildo7525/pretty_hover",
      opts = true,
      event = "LspAttach",
      enabled = dots.goodies.hover.type == "pretty",
    },
    {
      "lewis6991/hover.nvim",
      opts = true,
      event = "VeryLazy",
      enabled = dots.goodies.hover.type == "lewis6991",
    },
  }
