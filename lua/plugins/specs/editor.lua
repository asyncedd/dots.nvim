return not dots.editor.enabled and {}
  or {
    dots.editor.spider.enabled and {
      "chrisgrieser/nvim-spider",
      opts = {
        skipInsignificantPunctuation = false,
      },
      event = "VeryLazy",
      config = function(_, opts)
        require("spider").setup(opts)
        local keymap = vim.keymap.set

        keymap({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
        keymap({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
        keymap({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
        keymap({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
        keymap(
          { "n", "o", "x" },
          "W",
          "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-e" }
        )
        keymap(
          { "n", "o", "x" },
          "E",
          "<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-e" }
        )
        keymap(
          { "n", "o", "x" },
          "B",
          "<cmd>lua require('spider').motion('B', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-b" }
        )
        keymap(
          { "n", "o", "x" },
          "gE",
          "<cmd>lua require('spider').motion('ge', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-ge" }
        )
      end,
    },
    dots.editor.textobjs.enabled
      and {
        "chrisgrieser/nvim-various-textobjs",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
          require("various-textobjs").setup(opts)
          local keymap = vim.keymap.set

          keymap(
            { "x", "o" },
            "iW",
            "<cmd>lua require('various-textobjs').subword(true)<CR>",
            { desc = "inner subword" }
          )
          keymap(
            { "x", "o" },
            "aW",
            "<cmd>lua require('various-textobjs').subword(false)<CR>",
            { desc = "outer subword" }
          )
        end,
      },
    dots.editor.surround.enabled and {
      "kylechui/nvim-surround",
      opts = true,
      evnet = "VeryLazy",
    },
  }
