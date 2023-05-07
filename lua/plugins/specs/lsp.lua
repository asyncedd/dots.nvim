return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      return require("plugins.configs.lsp.mason-lsp")
    end,
    config = true,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function()
      return require("plugins.configs.lsp.mason-null")
    end,
    config = true,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp.config")

      require("plugins.configs.lsp.native")
    end,
    dependencies = {
      "mason-lspconfig.nvim",
      "neodev.nvim",
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWinEnter", "WinEnter" }, {
        callback = function()
          vim.schedule(function()
            local file = vim.fn.expand("%")
            local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""
            if condition then
              require("lazy").load({ plugins = "nvim-lspconfig" })
              vim.cmd("silent! do FileType")
            end
          end)
        end,
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return require("plugins.configs.lsp.null")
    end,
    config = true,
    dependencies = {
      "mason-null-ls.nvim",
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWinEnter", "WinEnter" }, {
        callback = function()
          vim.schedule(function()
            local file = vim.fn.expand("%")
            local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""
            if condition then
              require("lazy").load({ plugins = "null-ls.nvim" })
              vim.cmd("silent! do FileType")
            end
          end)
        end,
      })
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {
      library = {
        plugins = false,
        runtime = true,
        types = true,
      },
      -- lspconfig = false,
      pathStrict = true,
    },
    config = true,
  },
  {
    "nvimdev/lspsaga.nvim",
    opts = function()
      return require("plugins.configs.lsp.saga")
    end,
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Find the symbols's definition" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Open a code action (if any)", mode = { "n", "x" } },
      -- Renaming is handled by Spectre.nvim and, I don't want it to be handled by Lspsaga.
      { "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", desc = "Take a peek of the definition for the symbol" },
      { "<leader>lo", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto definition for the symbol." },
      { "<localleader>o", "<cmd>Lspsaga outline<CR>", desc = "Open Lspsaga's code outline" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostic messages in the current line" },
      {
        "<leader>sb",
        "<cmd>Lspsaga show_buf_diagnostics<CR>",
        desc = "Show diagnostic messages in the current buffer",
      },
      {
        "<leader>sw",
        "<cmd>Lspsaga show_workspace_diagnostics<CR>",
        desc = "Show diagnostic messages in the current workspace",
      },
      {
        "<leader>sc",
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        desc = "Show diagnostic messages in the hovered area",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWinEnter", "WinEnter" }, {
        callback = function()
          vim.schedule(function()
            local file = vim.fn.expand("%")
            local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""
            if condition then
              require("lazy").load({ plugins = "lspsaga.nvim" })
              vim.cmd("silent! do FileType")
            end
          end)
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Trouble for workspace" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Trouble for the current document" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle Trouble for loclist" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Trouble for quickfix" },
      { "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "Toggle Trouble for LSP references" },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    opts = true,
    keys = {
      { "<leader>gr", ":IncRename ", desc = "Toggle inc-rename" },
    },
    cmd = "IncRename",
  },
}
