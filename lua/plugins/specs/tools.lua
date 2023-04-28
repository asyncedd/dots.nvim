return {
  {
    "TimUntersberger/neogit",
    opts = {
      disable_commit_confirmation = true,
    },
    config = true,
    keys = {
      { "<leader>gt", "<cmd>Neogit<CR>" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("core.highlight.telescope")

      require("telescope").setup()
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        config = function()
          -- To get fzf loaded and working with telescope, you need to call
          -- load_extension, somewhere after setup function:
          require("telescope").load_extension("fzf")
        end,
        build = "make",
      },
      {
        "prochri/telescope-all-recent.nvim",
        opts = {
          default = {
            sorting = "frecency",
          },
        },
        dependencies = {
          "kkharji/sqlite.lua",
        },
        config = true,
      },
    },
    cmd = {
      "Telescope",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = {
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 300,
      },
    },
    config = function(_, opts)
      require("yanky").setup(opts)

      require("telescope").load_extension("yank_history")
    end,
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
      { "<C-n>", "<Plug>(YankyCycleForward)" },
      { "<C-p>", "<Plug>(YankyCyclePrevious)" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
      { "=p", "<Plug>(YankyPutAfterFilter)" },
      { "=P", "<Plug>(YankyPutBeforeFilter)" },
      { "<leader>fy", "<cmd>Telescope yank_history<CR>" },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
}
