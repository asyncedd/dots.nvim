return not dots.languages.python.enable and {}
  or {
    not dots.languages.python.LSP.config.enable and {} or {
      "neovim/nvim-lspconfig",
      opts = function(_, opts)
        for k, v in pairs(dots.languages.python.LSP.config.servers) do
          opts.servers[k] = v
        end
      end,
    },
    not dots.languages.python.LSP.null.enable and {} or {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, opts)
        for k, v in pairs(dots.languages.python.LSP.null.servers) do
          opts.sources[k] = v
        end
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        table.insert(opts.ensure_installed, {
          dots.languages.python.treesitter.base and "python",
        })
      end,
    },
  }
