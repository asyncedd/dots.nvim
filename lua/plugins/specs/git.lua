local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "lewis6991/gitsigns.nvim",
    init = lazyLoad("gitsigns.nvim"),
    config = function()
      require("git.gitsigns")
    end,
  },
  {
    "TimUntersberger/neogit",
    config = function()
      require("git.neogit")
    end,
    keys = {
      {
        "<leader>ng",
        function()
          require("neogit").open()
        end,
      },
    },
    cmd = {
      "Neogit",
    },
  },
}
