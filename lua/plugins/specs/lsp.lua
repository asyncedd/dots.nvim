return {
  {
    "neovim/nvim-lspconfig",
    event = "User LazyFile",
    config = function()
      dofile(vim.g.base46_cache .. "lsp")
      require("configs.lspconfig")
      require("nvchad.lsp")
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = function()
      return require("configs.conform")
    end,
    init = function()
      vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    cmd = "ConformInfo",
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {},
      linters = {},
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft
      for k, v in pairs(opts.linters) do
        lint.linters[k] = v
      end
    end,
    event = "LspAttach",
  },
}
