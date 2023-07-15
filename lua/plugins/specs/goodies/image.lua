return dots.goodies.image.enabled ~= true and {}
  or {
    {
      "3rd/image.nvim",
      opts = {
        backend = dots.goodies.image.backend,
      },
      event = "VeryLazy",
    },
  }
