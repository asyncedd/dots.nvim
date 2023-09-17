return {
  {
    "nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.ensure_installed, {
        "svelte",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "rust",
      })
    end,
  },
  {
    "nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        svelte = {},
        emmet_ls = {},
        tailwindcss = {},
      },
    },
  },
  {
    "null-ls.nvim",
    optional = true,
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
