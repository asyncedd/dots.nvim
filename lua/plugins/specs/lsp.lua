return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers_to_not_setup = {},
      servers = {},
      setup = {},
    },
    event = "User FilePost",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "lsp")

      require("plugins.configs.lsp.config")(opts)
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
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
  {
    "aznhe21/actions-preview.nvim",
    opts = function()
      return {
        diff = {
          algorithm = "histogram",
        },
        telescope = require("telescope.themes").get_cursor(),
      }
    end,
    keys = {
      { "<leader>ca", '<cmd>lua require("actions-preview").code_actions()<CR>', desc = "Code action: open menu" },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      priority = 40,
      autocmd = {
        enabled = true,
      },
    },
    event = "LspAttach",
  },
}
