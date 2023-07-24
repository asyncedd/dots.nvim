local notes = dots.notes

return not notes.enabled and {}
  or {
    not notes.neorg.enabled and {} or {
      {
        "nvim-neorg/neorg",
        opts = {
          load = notes.neorg.modules,
        },
        ft = "norg",
      },
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          table.insert(opts.ensure_installed, "norg")
        end,
      },
    },
  }
