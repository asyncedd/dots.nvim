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
        servers_to_not_setup = {
          "clangd",
        },
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
          -- https://www.reddit.com/r/neovim/comments/135fqp9/why_is_pyright_constantly_analyzing_files_it/
          pyright = {
            settings = {
              python = {
                analysis = {
                  autoImportCompletions = true,
                  typeCheckingMode = "off",
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  diagnosticMode = "workspace", -- "openFilesOnly",
                },
              },
            },
          },
          -- https://github.com/folke/dot/blob/master/nvim/lua/plugins/lsp.lua
          html = {},
          emmet_ls = {
            init_options = {
              html = {
                options = {
                  -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                  ["bem.enabled"] = true,
                },
              },
            },
          },
          gopls = {},
          ruff_lsp = {},
          clangd = {},
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
          rustfmt = {},
          goimports = {},
          goimports_reviser = {},
          gofumpt = {},
          ruff = {},
          gitlint = {},
          flake8 = {},
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
    "smjonas/inc-rename.nvim",
    keys = {
      { "gr", ":IncRename " },
    },
  },
  {
    "https://git.sr.ht/~p00f/clangd_extensions.nvim",
    opts = function()
      return {
        server = {
          on_attach = require("plugins.configs.lsp.config").on_attach,
        },
        extensions = {
          autoSetHints = false,
        },
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
            vim.schedule(function()
              require("lazy").load({ plugins = "clangd_extensions.nvim" })
              vim.cmd("silent! do FileType")
            end)
          end
        end,
      })
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
  },
  {
    "VidocqH/lsp-lens.nvim",
    opts = {
      enable = true,
      include_declaration = true, -- Reference include declaration
      sections = { -- Enable / Disable specific request
        definition = true,
        references = true,
        implementation = true,
      },
      ignore_filetype = {
        "prisma",
      },
    },
    event = "LspAttach",
  },
}
