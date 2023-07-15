return dots.image.enabled ~= true and {}
  or {
    {
      "3rd/image.nvim",
      opts = {
        backend = dots.image.backend,
      },
      event = "VeryLazy",
    },
  }
