return {
  {
    "chrisgrieser/nvim-spider",
    config = function()
      require("plugins.configs.motion.spider")
    end,
    keys = {
      { "w", mode = { "n", "x", "o" } },
      { "e", mode = { "n", "x", "o" } },
      { "b", mode = { "n", "x", "o" } },
      { "ge", mode = { "n", "x", "o" } },
    },
  },
}
