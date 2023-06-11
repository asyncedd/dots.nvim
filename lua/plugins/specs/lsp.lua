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
          ["prosemd_lsp"] = {},
          -- https://www.reddit.com/r/neovim/comments/135fqp9/why_is_pyright_constantly_analyzing_files_it/
          pyright = {
            pyright = {
              autoImportCompletion = true,
            },
          },
          svelte = {},
          -- https://github.com/folke/dot/blob/master/nvim/lua/plugins/lsp.lua
          tsserver = {
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "literal",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          },
          html = {},
          emmet_ls = {},
          gopls = {},
          ["rust_analyzer"] = {},
          ruff_lsp = {},
        },
      }
    end,
    init = function()
      require("core.utils.lazy")("nvim-lspconfig")
    end,
    config = function(_, opts)
      require("plugins.configs.lsp.config")(opts)

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
      local nls = require("null-ls")
      local B = nls.builtins
      return {
        -- A list of sources to install
        ---@type string[]
        ensure_installed = {
          "rustfmt",
          "stylua",
          "beautysh",
          "prettier",
          "actionlint",
          "flake8",
          "gitlint",
          "gofumpt",
          "goimports",
          "goimports-reviser",
          "mypy",
          "ruff",
          "black",
          "isort",
        },
        sources = {
          B.formatting.isort,
          B.formatting.black.with({
            args = {
              "--fast",
              "--quiet",
              "--stdin-filename",
              "$FILENAME",
              "-",
            },
          }),
          B.diagnostics.mypy,
          B.formatting.goimports,
          B.formatting.goimports_reviser,
          B.formatting.gofumpt,
          B.diagnostics.ruff,
          B.diagnostics.gitlint,
          B.diagnostics.flake8,
          B.diagnostics.actionlint,
          B.formatting.fish_indent,
          B.diagnostics.fish,
          B.formatting.stylua.with({
            condition = function(utils)
              return utils.root_has_file({ "stylua.toml" })
            end,
          }),
          B.formatting.beautysh.with({
            extra_args = { "-i", "2" },
          }),
          B.formatting.prettier,
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
    "rust-lang/rust.vim",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
        callback = function()
          if vim.bo.filetype == "rust" then
            vim.schedule(function()
              require("lazy").load({ plugins = "rust.vim" })
            end)
          end
        end,
      })
    end,
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    opts = {
      inlay_hints = {
        auto = false,
      },
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
        },
      },
    },
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
        callback = function()
          local filetype = vim.bo.filetype
          if filetype == "rust" or filetype == "toml" then
            vim.schedule(function()
              require("lazy").load({ plugins = "crates.nvim" })
              vim.cmd("silent! do FileType")
            end)
          end
        end,
      })
    end,
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    opts = true,
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end

          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
      })
    end,
    event = "LspAttach",
    branch = "anticonceal",
  },
}
