return {
  {
    "catppuccin/nvim",
    config = function()
      coroutine.resume(coroutine.create(function()
	require("plugins.configs.ui.catppuccin")
      end))
    end,
  },
}
