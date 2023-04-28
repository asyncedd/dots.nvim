return {
  "catppuccin/nvim",
  {
    "folke/noice.nvim",
    config = true,
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "UIEnter" }, {
        callback = function()
          vim.schedule(function()
            require("lazy").load({ plugins = "noice.nvim" })
          end)
        end,
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
