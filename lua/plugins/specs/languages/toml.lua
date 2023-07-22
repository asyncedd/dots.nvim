return not dots.languages.toml.enable and {}
  or {
    not dots.languages.toml.LSP.null.enable and {} or {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, opts)
        if opts.sources.prettierd == nil then
          opts.sources.prettierd = {}
        end
        if opts.sources.prettierd.extra_filetypes == nil then
          opts.sources.prettierd = { extra_filetypes = {} }
        end
        table.insert(opts.sources.prettierd.extra_filetypes, "toml")
      end,
    },
    not dots.languages.toml.LSP.config.enable and {} or {
      "neovim/nvim-lspconfig",
      opts = {
        servers = dots.languages.toml.LSP.config.servers,
      },
    },
  }
