return {
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "sindrets/winshift.nvim",
    opts = true,
    cmd = {
      "WinShift",
    },
  },
}
