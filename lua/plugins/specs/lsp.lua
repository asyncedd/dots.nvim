return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers_to_not_setup = {},
      servers = {},
      setup = {},
    },
    event = "LazyFile",
    config = function(_, opts)
      require("plugins.configs.lsp.config")(opts)
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          {
            "williamboman/mason.nvim",
            opts = true,
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    init = function()
      vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
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
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      local g = vim.g

      g.code_action_menu_window_border = "solid"
      g.code_action_menu_show_details = true
      g.code_action_menu_show_diff = true
      g.code_action_menu_show_action_kind = false
    end,
    keys = {
      { "<leader>ca", "<cmd>CodeActionMenu<CR>", desc = "Open the code action menu", mode = { "x", "n" } },
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
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {},
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
