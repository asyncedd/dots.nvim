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
          "rust_analyzer",
          "clangd",
          "tsserver",
        },
        servers = {
          lua_ls = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
              runtime = {
                pathStrict = true,
              },
              completion = {
                callSnippet = "Both",
              },
              diagnostics = {
                globals = {
                  "vim",
                },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                  [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
                checkThirdParty = false,
              },
            },
          },
          cssls = {},
          jsonls = {
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          },
          tailwindcss = {},
          marksman = {},
          prosemd_lsp = {},
          -- https://www.reddit.com/r/neovim/comments/135fqp9/why_is_pyright_constantly_analyzing_files_it/
          pyright = {
            pyright = {
              autoImportCompletion = true,
            },
          },
          svelte = {},
          -- https://github.com/folke/dot/blob/master/nvim/lua/plugins/lsp.lua
          tsserver = {},
          html = {},
          emmet_ls = {},
          gopls = {},
          rust_analyzer = {},
          ruff_lsp = {},
          bashls = {},
          eslint = {},
          clangd = {},
          solargraph = {},
          jdtls = {},
          nil_ls = {},
          rnix = {},
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
      "neodev.nvim",
      "b0o/SchemaStore.nvim",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return {
        -- A list of sources to install
        sources = {
          require("typescript.extensions.null-ls.code-actions"),
          rustfmt = {},
          isort = {},
          black = {
            with = {
              args = {
                "--fast",
                "--quiet",
                "--stdin-filename",
                "$FILENAME",
                "-",
              },
            },
          },
          mypy = {},
          goimports = {},
          goimports_reviser = {},
          gofumpt = {},
          ruff = {},
          gitlint = {},
          flake8 = {},
          actionlint = {},
          fish_indent = {},
          fish = {},
          stylua = {
            condition = function(utils)
              return utils.root_has_file({ "stylua.toml" })
            end,
          },
          beautysh = {
            extra_args = { "-i", "2" },
          },
          prettierd = {
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
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
  },
  {
    "folke/neodev.nvim",
    opts = {
      -- When enabled = false, Neodev will not make any changes to the sumneko_lua thus, disbling it.
      enabled = true,
      -- When, plugins = true, it'll add plugins managed by lazy.nvim or packer.nvim to the workspace. (For now, it'll use lazy.nvim)
      -- When it's false, it'll be the oppisite.
      -- But, if it's an array, it'll only add the plugins specified to the workspace.
      -- It'll be good to only add the plugins you use into the list.
      ---@type string[]
      plugins = {
        "lazy.nvim",
      },
      -- If runtime = true, it'll add the runtime (excluding the plugins I think?) to the workspace.
      -- If it's false, it'll not have intellisense for your configuration.
      -- I also believe it'll add the "vim" global too.
      runtime = true,
      -- Enable if you want types for Neovim Lua stuff.
      -- For example, Neovim options, vim.treesitter, vim.opt, vim.o, vim.g, vim.api, vim.cmd, vim.loop and vim.fn etc..
      -- These are auto-generated by Neodev.
      types = true,
      -- pathStrict being true, it'll be wayyyyy faster.
      -- runtime.path will only search the first level of directories.
      pathStrict = true,
    },
    config = function(_, opts)
      require("plugins.configs.lsp.neodev")(opts)
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    opts = function()
      return {
        tools = {
          inlay_hints = {
            auto = false,
            show_parameter_hints = false,
          },
        },
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
        server = {
          on_attach = require("plugins.configs.lsp.config").on_attach,
        },
      }
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
      vim.cmd("silent! do FileType")
    end,
    dependencies = "nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          if vim.bo.filetype == "rust" then
            vim.schedule(function()
              require("lazy").load({ plugins = "rust-tools.nvim" })
              vim.cmd("silent! do FileType")
            end)
          end
        end,
      })
    end,
  },
  {
    "saecki/crates.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        pattern = "Cargo.toml",
        callback = function()
          require("lazy").load({ plugins = "crates.nvim" })
          vim.cmd("silent! do FileType")
        end,
      })
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    keys = {
      { "<leader>rn", ":IncRename " },
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
  },
  {
    "pmizio/typescript-tools.nvim",
    opts = function()
      return {
        on_attach = require("plugins.configs.lsp.config").on_attach,
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          local std = require("std")
          local ft = vim.bo.filetype
          if
            std.exists_in_array({
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
            }, ft)
          then
            vim.schedule(function()
              require("lazy").load({ plugins = "typescript-tools.nvim" })
              vim.cmd("silent! do FileType")
            end)
          end
        end,
      })
    end,
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
