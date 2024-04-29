return {
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "lsp")
      local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

      if inlay_hint then
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.server_capabilities.inlayHintProvider then
              inlay_hint.enable(true)
            end
          end,
        })
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      }

      require("lspconfig")["rust_analyzer"].setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            check = {
              command = "clippy",
              allFeatures = true,
              extraArgs = {
                "--",
                "-W clippy::pedantic",
                "-W clippy::nursery",
                "-W clippy::unwrap_used",
                "-W clippy::expect_used",
              },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      })

      require("lspconfig")["nil_ls"].setup({ capabilities = capabilities })
      require("lspconfig")["lua_ls"].setup({
        capabilities = capabilities,
        settings = {
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
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
              checkThirdParty = false,
            },
          },
        },
      })

      require("lspconfig")["clangd"].setup({ capabilities = capabilities })
      require("lspconfig")["svelte"].setup({ capabilities = capabilities })
      require("lspconfig")["emmet_ls"].setup({ capabilities = capabilities })
      require("lspconfig")["tailwindcss"].setup({ capabilities = capabilities })
      require("lspconfig")["taplo"].setup({ capabilities = capabilities })
      require("lspconfig")["cssls"].setup({
        capabilities = capabilities,
        cmd = { "css-languageserver", "--stdio" },
      })
      require("lspconfig")["marksman"].setup({ capabilities = capabilities })
      require("lspconfig")["hls"].setup({ capabilities = capabilities })
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
