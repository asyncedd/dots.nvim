return not dots.filetypes.astro == true and {}
  or {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          astro = {},
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "astro" })
        end
      end,
    },
  }
