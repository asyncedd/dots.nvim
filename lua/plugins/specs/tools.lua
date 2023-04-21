return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("tools.telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    event = "VeryLazy",
  },
  {
    "thePrimeagen/harpoon",
    config = function()
      require("tools.harpoon")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("tools.nvimtree")
    end,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFocus",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>tr", "<cmd>NvimTreeToggle<cr>" },
    },
  },
  {
    "folke/trouble.nvim",
    config = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
      { "gR", "<cmd>TroubleToggle lsp_references<cr>" },
    },
  },
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    keys = {
      { "<leader>gt", "<cmd>Neogit<cr>" },
    },
    config = function()
      require("tools.neogit")
    end,
  },
  {
    "rafcamlet/nvim-luapad",
    lazy = true,
    cmd = {
      "Luapad",
      "LuaRun",
      "Lua",
    },
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end,
    event = "VeryLazy",
  },
  {
    "stevearc/oil.nvim",
    config = true,
    keys = {
      { "<leader>oil", "<cmd>Oil<cr>", { desc = "Open that coconut oil!" } },
      {
        "-",
        function()
          require("oil").open()
        end,
        { desc = "Open parent directory" },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    config = true,
    keys = {
      { "<leader>dv", "<cmd>DiffviewOpen<cr>" },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = { "VimBeGood" },
  },
}
