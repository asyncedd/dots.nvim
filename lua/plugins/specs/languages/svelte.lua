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
        servers = {
          svelte = dots.languages.svelte.LSP.enable and {} or nil,
        },
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
      opts = {
        sources = {
          prettierd = {
            extra_filetypes = { "svelte" },
          },
        },
      },
    },
  }
