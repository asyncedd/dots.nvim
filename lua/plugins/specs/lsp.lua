local lazyLoad = require("core.utils.lazyLoad")

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      -- "SmiteshP/nvim-navic",
      "folke/neodev.nvim",
    },
    config = function()
      require("lsp.mason")
    end,
    init = lazyLoad("mason.nvim"),
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup()
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      --Please make sure you install markdown and markdown_inline parser
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<cr>" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", mode = { "n", "v" } },
      { "gr", "<cmd>Lspsaga rename<cr>" },
      { "<leader>gr", "<cmd>Lspsaga rename ++project<cr>" },
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
      {
        "[E",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
      },
      {
        "]E",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
      },
      { "<leader>lo", "<cmd>Lspsaga outline<cr>" },
      { "K", "<cmd>Lspsaga hover_doc ++keep<cr>" },
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>" },
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>" },
      { "<A-d>", "<cmd>Lspsaga term_toggle<cr>", mode = { "n", "t" } },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
    cmd = {
      "Trouble",
      "TroubleClose",
      "TroubleToggle",
      "TroubleRefresh",
    },
    keys = {
      { "<leader>qf", "<cmd>TroubleToggle quickfix<cr>" },
      { "<leader>xx", "<cmd>TroubleToggle<cr>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
      { "<leader>xd", "<cmd>TroubleToggle documnet_diagnostics<cr>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
      { "<leader>gR", "<cmd>TroubleToggle lsp_references<cr>" },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    config = true,
    cmd = {
      "SymbolsOutline",
      "SymbolsOutlineOpen",
      "SymbolsOutlineClose",
    },
    keys = {
      { "<leader>so", "<cmd>SymbolsOutline<cr>" },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = lazyLoad("null-ls.nvim"),
    config = function()
      require("lsp.null")
    end,
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
    config = function(_, opts)
      require("trouble").setup(opts)
    end,
    keys = {
      { "<leader>xx", "<cmd>Trouble<CR>" },
      { "<leader>xd", "<cmd>Trouble documnet_diagnostics<CR>" },
      { "<leader>xw", "<cmd>Trouble workspace_diagnostics<CR>" },
      { "<leader>gR", "<cmd>Trouble lsp_references<CR>" },
      { "<leader>xq", "<cmd>Trouble lsp_references<CR>" },
      { "<leader>xl", "<cmd>Trouble loc_list<CR>" },
    },
  },
}
