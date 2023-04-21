return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle },
    },
    event = "TextChanged",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gstatus",
      "Gedit",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Gmove",
      "Gdelete",
      "Gbrowse",
    },
    keys = {
      { "<leader>vf", "<cmd>G<cr>" },
    },
  },
  {
    "sbdchd/neoformat",
    event = { "BufWritePre" },
    config = function()
      vim.api.nvim_command("Neoformat")
    end,
    cmd = { "Neoformat" },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>" },
    },
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "x", "n" } },
      { "P", "<Plug>(YankyPutBefore)", mode = { "x", "n" } },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "x", "n" } },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "x", "n" } },
      { "<C-n>", "<Plug>(YankyCycleFoward)", mode = { "n" } },
      { "<C-p>", "<Plug>(YankyCycleBackward)", mode = { "n" } },
      { "<leader>yh", '<cmd>lua require("telescope").extensions.yank_history.yank_history()<cr>' },
    },
    config = function()
      require("tools.yanky")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>af",
        function()
          require("harpoon.mark").add_file()
        end,
      },
      {
        "<leader>mn",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
      },
      {
        "<leader>5",
        function()
          require("harpoon.ui").nav_file(5)
        end,
      },
      {
        "<leader>nn",
        function()
          require("harpoon.ui").nav_next()
        end,
      },
      {
        "<leader>np",
        function()
          require("harpoon.ui").nav_prev()
        end,
      },
      {
        "<leader>" .. vim.v.count .. "nn",
        function()
          require("harpoon.ui").nav_next()
        end,
      },
      {
        "<leader>" .. vim.v.count .. "np",
        function()
          require("harpoon.ui").nav_prev()
        end,
      },
    },
  },
  {
    "TimUntersberger/neogit",
    config = true,
    keys = {
      {
        "<leader>ng",
        function()
          require("neogit").open()
        end,
      },
    },
  },
}
