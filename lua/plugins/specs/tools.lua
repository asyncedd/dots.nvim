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
      "nvim-telescope/telescope-frecency.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "kkharji/sqlite.lua",
      "olimorris/persisted.nvim",
    },
    keys = {
      -- {
      --   "<leader>ff",
      --   function()
      --     require("telescope.builtin").find_files()
      --   end,
      -- },
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
        "<leader>ff",
        function()
          require("telescope.builtin").help_tags()
        end,
      },
      { "<leader>fr", "<cmd>Telescope frecency workspace=CWD<cr>" },
      { "<leader>fs", "<cmd>Telescope persisted<cr>" },
    },
    config = function()
      require("tools.telescope")
    end,
    cmd = "Telescope",
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
        "<C-1>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
      },
      {
        "<C-2>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
      },
      {
        "<C-3>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
      },
      {
        "<C-4>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
      },
      {
        "<C-5>",
        function()
          require("harpoon.ui").nav_file(5)
        end,
      },
      {
        "<C-6>",
        function()
          require("harpoon.ui").nav_file(6)
        end,
      },
      {
        "<C-7>",
        function()
          require("harpoon.ui").nav_file(7)
        end,
      },
      {
        "<C-8>",
        function()
          require("harpoon.ui").nav_file(8)
        end,
      },
      {
        "<C-9>",
        function()
          require("harpoon.ui").nav_file(9)
        end,
      },
      {
        "<C-$>",
        function()
          require("harpoon.ui").nav_file(-1)
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
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("tools.nvimtree")
    end,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeCollapse",
    },
    keys = {
      { "<leader>tr", "<cmd>NvimTreeToggle<cr>" },
      { "<leader>tc", "<cmd>NvimTreeCollapse<cr>" },
      { "<leader>tf", "<cmd>NvimTreeFocus<cr>" },
      { "<leader>ft", "<cmd>NvimTreeFindFile<cr>" },
    },
  },
  {
    "ray-x/sad.nvim",
    dependencies = { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
    config = function()
      require("sad").setup({})
    end,
    cmd = "Sad",
    keys = {
      { "<leader>sd", "<cmd>Sad<cr>" },
    },
  },
  {
    "kevinhwang91/nvim-fundo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    build = function()
      require("fundo").install()
    end,
    config = true,
  },
  {
    "olimorris/persisted.nvim",
    config = true,
    event = "VeryLazy",
    cmd = {
      "SessionToggle",
      "SessionStart",
      "SessionStop",
      "SessionSave",
      "SessionLoad",
      "SessionLoadLast",
      "SessionLoadFromFile",
      "SessionDelete",
    },
    keys = {
      { "<leader>ss", "<cmd>SessionSave<cr>" },
    },
  },
}
