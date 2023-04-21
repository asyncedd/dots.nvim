return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("tools.telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    event = "VeryLazy"
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
      "nvim-tree/nvim-web-devicons"
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
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
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
      require('aerial').setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
        end
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    end,
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jbyuki/one-small-step-for-vimkind",
      "rcarriga/nvim-dap-ui",
    },
    keys = {
      { "<leader>bp", function() require("dap").toggle_breakpoint() end },
      { "<leader>dc", function() require("dap").continue() end },
      { "<leader>so", function() require("dap").step_over() end },
      { "<leader>si", function() require("dap").step_into() end },
      { "<leader>uh", function() require("dap.ui.widgets").hover() end },
      { "<leader>ol", function() require("osv").launch({ port = 8086} ) end },
      { "<leader>runit", function() require("osv").run_this() end },
    },
    config = function()
      require("dap.dap")
    end,
  },
  {
    "michaelb/sniprun",
    build = "bash install.sh",
    cmd = {
      "SnipRun",
      "SnipInfo",
      "SnipClose",
      "SnipReplMemoryClean",
      "SnipReset",
    },
    keys = {
      { "<leader>sp", ":SnipRun<cr>", mode = { "v", "n" } },
    },
  },
}
