return not dots.languages.markdown.enable and {}
  or {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        local grammars = {}
        for i, grammar in ipairs(dots.languages.markdown.treesitter.additional_parsers) do
          table.insert(grammars, grammar)
        end

        table.insert(opts.ensure_installed, {
          dots.languages.markdown.treesitter.markdown and "markdown",
          dots.languages.markdown.treesitter.markdown_inline and "markdown_inline",
          grammars,
        })
      end,
    },
    not dots.languages.markdown.LSP.enable and {} or {
      "neovim/nvim-lspconfig",
      opts = function(_, opts)
        for k, v in pairs(dots.languages.markdown.LSP.providers) do
          opts.servers[k] = v
        end
      end,
    },
  }
