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
          rust_analyzer = {},
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
        },
      }
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
    event = "User After",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        -- A list of sources to install
        ---@type string[]
        ensure_installed = {
          "stylua",
          "beautysh",
          "prettier",
        },
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua.with({
            condition = function(utils)
              return utils.root_has_file({ "stylua.toml" })
            end,
          }),
          nls.builtins.formatting.beautysh.with({
            extra_args = { "-i", "2" },
          }),
          nls.builtins.formatting.prettier,
        },
      }
    end,
    config = function(_, opts)
      require("plugins.configs.lsp.null")(opts)
    end,
    event = "User After",
  },
  {
    "folke/neodev.nvim",
    opts = {
      library = {
        ---@type string[]
        plugins = {
          "nvim-dap-ui",
          "catppuccin",
        },
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
      { "gf", "<cmd>Lspsaga lsp_finder<CR>", desc = "Find the symbols's definition" },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<CR>",
        desc = "Open a code action (if any)",
        mode = {
          "n",
          "x",
        },
      },
      -- Renaming is handled by Spectre.nvim and, I don't want it to be handled by Lspsaga.
      { "<leader>lp", "<cmd>Lspsaga peek_definition<CR>", desc = "Take a peek of the definition for the symbol" },
      { "<leader>lo", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto definition for the symbol." },
      { "<leader>so", "<cmd>Lspsaga outline<CR>", desc = "Open Lspsaga's code outline" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostic messages in the current line" },
      {
        "<leader>lb",
        "<cmd>Lspsaga show_buf_diagnostics<CR>",
        desc = "Show diagnostic messages in the current buffer",
      },
      {
        "<leader>lw",
        "<cmd>Lspsaga show_workspace_diagnostics<CR>",
        desc = "Show diagnostic messages in the current workspace",
      },
      {
        "<leader>lc",
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        desc = "Show diagnostic messages in the hovered area",
      },
    },
    event = "User After",
  },
  {
    "folke/trouble.nvim",
    opts = true,
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Show workspace diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Show document diagnostics" },
      { "<leader>xq", "<cmd>TroubleToggle loclist<cr>", desc = "Show loclist" },
      { "<leader>xl", "<cmd>TroubleToggle quickfix<cr>", desc = "Show Quickfix" },
    },
  },
}
