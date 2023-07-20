return not dots.languages.markdown.enable and {}
  or {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        local grammars = {}
        if #dots.languages.markdown.treesitter.additional_parsers > 0 then
          for i, grammar in ipairs(dots.languages.markdown.treesitter.additional_parsers) do
            table.insert(grammars, grammar)
          end
        end

        table.insert(opts.ensure_installed, {
          dots.languages.markdown.treesitter.markdown and "markdown",
          dots.languages.markdown.treesitter.markdown_inline and "markdown_inline",
          grammars,
        })
      end,
    },
  }
