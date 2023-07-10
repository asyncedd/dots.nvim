return dots.languages.fish ~= true and {}
  or {
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = {
        sources = {
          fish = {},
          fish_indent = {},
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "fish" })
        end
      end,
    },
  }
