return not dots.languages.svelte.enable and {}
  or {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        table.insert(opts.ensure_installed, {
          dots.languages.svelte.treesitter.base and "svelte",
          dots.languages.svelte.treesitter.javascript and "javascript",
          dots.languages.svelte.treesitter.typescript and "typescript",
          dots.languages.svelte.treesitter.rust and "rust",
        })
      end,
    },
  }
