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
    "echasnovski/mini.files",
    opts = {
      windows = {
        -- Whether to show preview of directory under cursor
        preview = true,
      },
    },
    init = function()
      -- vim.fn.argc() returns an integer on how much arguments that Neovim has been started with.
      --
      -- For ex.
      --
      -- "nvim" -> 0
      -- "nvim ." -> 1
      -- "nvim . ." -> 2
      -- "nvim 1 2 3 4 5 6 7 8 9 0" -> 10
      --
      -- So, using this, we'll check if vim.fn.argc() is 1 or over 1
      if vim.fn.argc() >= 1 then
        -- Get the information of the file/directory of vim.fn.argv(0)
        --
        -- vim.fn.argv(0) it self is the first argument that Neovim was started with.
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        -- loading it when the first argument is a directory.
        -- load "mini.files"
        if stat and stat.type == "directory" then
          require("lazy").load({ plugins = { "mini.files" } })
        end
      end
      -- If Neovim wasn't started with all of that, check if mini.files was loaded
      -- once, we load it, we don't have to load it twice, sooo...
      if not require("lazy.core.config").plugins["mini.files"]._.loaded then
        -- If it doesn't, create a new "BufNew" autocommand
        vim.api.nvim_create_autocmd("BufNew", {
          callback = function()
            -- If that file is a directory, load mini.files
            if vim.fn.isdirectory(vim.fn.expand("<afile>")) == 1 then
              require("lazy").load({ plugins = { "mini.files" } })
              -- Once oil is loaded, we can delete this autocmd
              return true
            end
          end,
        })
      end
    end,
    keys = {
      {
        "<leader>to",
        function()
          require("mini.files").open()
        end,
      },
    },
  },
}
