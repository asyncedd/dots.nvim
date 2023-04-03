return {
  -- Tools
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = require("plugins.configs.tools.tree"),
    event = "VeryLazy",
  },
  -- Intergrate Git with Neovim.
  -- Tpope's holy vim-fugitive
  {
    "tpope/vim-fugitive",
    -- config = true,
    -- Set some commands to load for.

    config = function()
      vim.api.nvim_set_keymap("n", "<leader>gi", ":Git<CR>", { desc = "Open Vim-Fugitive" })
    end,
    event = "VeryLazy",
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.api.nvim_set_keymap(
        "n",
        "<leader>lgi",
        ":LazyGitFilter<CR>",
        { desc = "Open Lazy-Git (needs Lazygit installed.)" }
      )
    end,
    event = "VeryLazy",
  },
}
