-- lua/plugins/specs/tools.lua
--
--  ┌
--  │              Some tools for the best editor
--  └

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require("plugins.configs.tools.telescope")
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

      require("telescope").load_extension("fzy_native")

      require("telescope").load_extension("persisted")
    end,
    dependencies = {
      "nvim-treesitter",
      "nvim-web-devicons",
      "persisted.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "plenary.nvim",
    },
    keys = {
      -- { "<leader>ff", "<cmd>lua require('telescope').extensions.smart_open.smart_open({ cwd_only = true })<CR>", desc = "Find files" },
      -- { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find grep" },
      { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>>", desc = "Fuzzy find in buffer" },
    },
    cmd = "Telescope",
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }
    end,
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Toggle Lazygit" },
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = function()
      return require("plugins.configs.tools.aerial")
    end,
    config = true,
    cmd = {
      "AerialToggle",
    },
    keys = {
      { "<leader>tc", "<cmd>AerialToggle<CR>" },
    },
  },
  {
    "danielfalk/smart-open.nvim",
    dependencies = {
      "telescope.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "sqlite.lua",
    },
    branch = "0.2.x",
    keys = {
      {
        "<leader>ff",
        "<cmd>lua require('telescope').extensions.smart_open.smart_open({ cwd_only = true })<CR>",
        desc = "Find files",
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = true,
    dependencies = {
      "nvim-web-devicons",
    },
    cmd = {
      "Oil",
    },
    keys = {
      { "<leader>to", "<cmd>Oil<CR>", desc = "Toggle Oil" },
    },
    init = function()
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
      if vim.loop.fs_stat(bufname) and vim.loop.fs_stat(bufname).type == "directory" then
        require("lazy").load({ plugins = "oil.nvim" })
      end
    end,
  },
}
