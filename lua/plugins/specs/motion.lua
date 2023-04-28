return {
  {
    "chrisgrieser/nvim-spider",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.motion.spider")
    end,
  },
}
