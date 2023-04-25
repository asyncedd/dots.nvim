local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "akinsho/bufferline.nvim",
    init = lazyLoad("bufferline.nvim"),
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
    },
    config = function()
      require("ui.bufferline")
    end,
    keys = {
      { "<leader>fc", "<cmd>BufferLineTogglePin<cr>" },
      { "<leader>gbp", "<cmd>BufferLinePick<cr>" },
      { "<leader>gb", "<cmd>BufferLinePickClose<cr>" },
      { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>" },
      { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>" },
      { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>" },
      { "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>" },
      { "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>" },
      { "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>" },
      { "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>" },
      { "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>" },
      { "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>" },
      { "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>" },
      { "<leader>gn", "<cmd>BufferLineCycleNext<cr>" },
      { "<leader>gb", "<cmd>BufferLineCyclePrev<cr>" },
      { "<leader>gl", "<cmd>BufferLineCycleNext<cr>" },
      { "<leader>gh", "<cmd>BufferLineCyclePrev<cr>" },
      { "<tab>", "<cmd>BufferLineCycleNext<cr>" },
      { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>" },
      { "[b", "<cmd>BufferLineMoveNext<cr>" },
      { "]b", "<cmd>BufferLineMovePrev<cr>" },
    },
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup()

      require("telescope").load_extension("scope")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>fb", "<cmd>Telescope scope buffers<CR>" },
    },
  },
  -- {
  --   "nanozuki/tabby.nvim",
  --   config = true,
  --   -- event = { "VeryLazy", "BufReadPost" },
  --   init = lazyLoad("tabby.nvim"),
  -- },
}
