return not dots.languages.python.enable and {}
  or {
    not dots.languages.python.LSP.config.enable and {} or {
      "neovim/nvim-lspconfig",
      optional = true,
      opts = function(_, opts)
        for k, v in pairs(dots.languages.python.LSP.config.servers) do
          opts.servers[k] = v
        end
      end,
    },
    not dots.languages.python.LSP.null.enable and {} or {
      "jose-elias-alvarez/null-ls.nvim",
      optional = true,
      opts = function(_, opts)
        for k, v in pairs(dots.languages.python.LSP.null.servers) do
          opts.sources[k] = v
        end
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      optional = true,
      opts = function(_, opts)
        table.insert(opts.ensure_installed, {
          dots.languages.python.treesitter.base and "python",
          dots.languages.python.treesitter.ninja and "ninja",
          dots.languages.python.treesitter.rst and "rst",
          dots.languages.python.treesitter.toml and "toml",
        })
      end,
    },
    {
      -- "numiras/semshi",
      "wookayin/semshi", -- use a maintained fork
      enabled = dots.languages.python.semshi.enable,
      ft = "python",
      build = ":UpdateRemotePlugins",
      init = function()
        -- Disabled these features better provided by LSP or other more general plugins
        vim.g["semshi#error_sign"] = false
        vim.g["semshi#simplify_markup"] = false
        vim.g["semshi#mark_selected_nodes"] = false
        vim.g["semshi#update_delay_factor"] = 0.001

        -- This autocmd must be defined in init to take effect
        vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
          group = vim.api.nvim_create_augroup("SemanticHighlight", {}),
          callback = function()
            -- Only add style, inherit or link to the LSP's colors
            vim.cmd([[
            highlight! semshiGlobal gui=italic
            highlight! semshiImported gui=bold
            highlight! link semshiParameter @lsp.type.parameter
            highlight! link semshiParameterUnused DiagnosticUnnecessary
            highlight! link semshiBuiltin @function.builtin
            highlight! link semshiAttribute @attribute
            highlight! link semshiSelf @lsp.type.selfKeyword
            highlight! link semshiUnresolved @lsp.type.unresolvedReference
            ]])
          end,
        })
      end,
    },
  }
