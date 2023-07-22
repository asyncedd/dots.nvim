return not dots.languages.svelte.enable and {}
  or {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        table.insert(opts.ensure_installed, {
          dots.languages.svelte.treesitter.base and "svelte",
          dots.languages.svelte.treesitter.css and "css",
          dots.languages.svelte.treesitter.javascript and "javascript",
          dots.languages.svelte.treesitter.typescript and "typescript",
          dots.languages.svelte.treesitter.rust and "rust",
        })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = dots.languages.svelte.LSP.servers,
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        ensure_installed = { dots.languages.svelte.DAP.enable and "js" },
        handlers = {},
      },
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, opts)
        if opts.sources.prettierd == nil then
          opts.sources.prettierd = {}
        end
        if opts.sources.prettierd.extra_filetypes == nil then
          opts.sources.prettierd = { extra_filetypes = {} }
        end

        table.insert(opts.sources.prettierd.extra_filetypes, "svelte")
      end,
    },
  }
