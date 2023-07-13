-- lua/plugins/specs/lsp.lua
--
--  ┌
--  │     Make Vim better than VSCode, even though it has
--  │                   always have been 🔫
--  └

return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      return {
        -- A list of servers not to setup.
        -- This is useful if you have some LSPs you want to setup with other plugins (eg. rust-tools.nvim)
        servers = {
          cssls = {
            settings = {
              css = {
                lint = {
                  unknownAtRules = "ignore",
                },
              },
            },
          },
          jsonls = {
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          },
          tailwindcss = {},
          -- https://github.com/folke/dot/blob/master/nvim/lua/plugins/lsp.lua
          html = {},
          gopls = {},
          ruff_lsp = {},
          solargraph = {},
          jdtls = {},
          nil_ls = {},
          rnix = {},
          taplo = {},
          pylsp = {},
        },
        setup = {
          eslint = function()
            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function(event)
                local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
                if client then
                  local diag =
                    vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                  if #diag > 0 then
                    vim.cmd("EslintFixAll")
                  end
                end
              end,
            })
          end,
          pyright = function()
            local on_attach = function(on_attach)
              vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                  local bufnr = args.buf
                  local client = vim.lsp.get_client_by_id(args.data.client_id)
                  on_attach(client, bufnr)
                end,
              })
            end
            on_attach(function(client, bufnr)
              local map = function(mode, lhs, rhs, desc)
                if desc then
                  desc = desc
                end
                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
              end
              -- stylua: ignore
              if client.name == "pyright" then
                map("n", "<leader>lo", "<cmd>PyrightOrganizeImports<cr>",  "Organize Imports" )
                map("n", "<leader>lC", function() require("dap-python").test_class() end,  "Debug Class" )
                map("n", "<leader>lM", function() require("dap-python").test_method() end,  "Debug Method" )
                map("v", "<leader>lE", function() require("dap-python").debug_selection() end, "Debug Selection" )
              end
            end)
          end,
        },
      }
    end,
    init = function()
      require("core.utils.lazy")("nvim-lspconfig")
    end,
    config = function(_, opts)
      require("plugins.configs.lsp.config").setup(opts)

      require("plugins.configs.lsp.native")
    end,
    dependencies = {
      "mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return {
        -- A list of sources to install
        sources = {
          goimports = {},
          goimports_reviser = {},
          gofumpt = {},
          gitlint = {},
          actionlint = {},
          prettier = {
            extra_filetypes = { "svelte", "toml" },
          },
        },
      }
    end,
    config = function(_, opts)
      require("plugins.configs.lsp.null")(opts)
    end,
    init = function()
      require("core.utils.lazy")("null-ls.nvim")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      lightbulb = {
        virtual_text = false,
      },
    },
    event = "LspAttach",
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>" },
      { "gt", "<cmd>Lspsaga goto_type_definition<CR>" },
      { "K", "<cmd>Lspsaga hover_doc ++keep<CR>" },
    },
    enabled = dots.lsp.saga,
  },
  {
    "dgagn/diagflow.nvim",
    opts = {},
    event = "LspAttach",
    enabled = dots.lsp.diagnostics.helix,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    opts = true,
    config = function(_, opts)
      require("lsp_lines").setup(opts)

      vim.diagnostic.config({
        virtual_text = not dots.lsp.diagnostics.lines.enabled,
      })
    end,
    event = "LspAttach",
    enabled = dots.lsp.diagnostics.lines.enabled,
  },
  {
    "folke/trouble.nvim",
    opts = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<CR>" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<CR>" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>" },
      { "<leader>xR", "<cmd>TroubleToggle lsp_references<CR>" },
    },
    enabled = dots.lsp.diagnostics.trouble.enabled,
  },
}
