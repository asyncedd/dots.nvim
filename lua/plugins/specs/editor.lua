return not dots.editor.enabled and {}
  or {
    {
      "chrisgrieser/nvim-spider",
      opts = {
        skipInsignificantPunctuation = false,
      },
      enabled = dots.editor.spider.enabled,
      event = "VeryLazy",
      keys = {
        { mode = { "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" } },
        { mode = { "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" } },
        { mode = { "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" } },
        { mode = { "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" } },
        {
          mode = { "n", "o", "x" },
          "W",
          "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-W" },
        },
        {
          mode = { "n", "o", "x" },
          "E",
          "<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-E" },
        },
        {
          mode = { "n", "o", "x" },
          "B",
          "<cmd>lua require('spider').motion('b', { skipInsignificantPunctuation = true } )<CR>",
          { desc = "Spider-B" },
        },
        {
          mode = { "n", "o", "x" },
          "gB",
          "<cmd>lua require('spider').motion('ge', { skipInsignificantPunctuation = true })<CR>",
          { desc = "Spider-W" },
        },
      },
    },
    {
      "chrisgrieser/nvim-various-textobjs",
      opts = {},
      event = "VeryLazy",
      enabled = dots.editor.textobjs.enabled,
      keys = {
        {
          mode = { "x", "o" },
          "iw",
          "<cmd>lua require('various-textobjs').subword(true)<cr>",
          { desc = "inner subword" },
        },
        {
          mode = { "x", "o" },
          "aw",
          "<cmd>lua require('various-textobjs').subword(false)<cr>",
          { desc = "outer subword" },
        },
        {
          mode = { "x", "o" },
          "iW",
          "<cmd>lua require('various-textobjs').subword(true)<cr>",
          { desc = "inner subword" },
        },
        {
          mode = { "x", "o" },
          "aW",
          "<cmd>lua require('various-textobjs').subword(false)<cr>",
          { desc = "outer subword" },
        },
      },
    },
    {
      "kylechui/nvim-surround",
      opts = true,
      event = "VeryLazy",
      enabled = dots.editor.surround.enabled,
    },
    {
      "lewis6991/gitsigns.nvim",
      ft = { "gitcommit", "diff" },
      init = function()
        -- load gitsigns only when a git file is opened
        vim.api.nvim_create_autocmd({ "BufRead" }, {
          group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
          callback = function()
            vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
            if vim.v.shell_error == 0 then
              vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
              vim.schedule(function()
                require("lazy").load({ plugins = { "gitsigns.nvim" } })
              end)
            end
          end,
        })
      end,
      opts = {
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        auto_install = true,
        ensure_installed = {},
        highlight = {
          enable = true,
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
      event = {
        "BufRead",
        "BufWinEnter",
        "BufNewFile",
      },
      enabled = dots.treesitter.enabled,
    },
    {
      "folke/flash.nvim",
      opts = {
        label = {
          rainbow = {
            enabled = true,
            shade = 3,
          },
        },
        modes = {
          char = {
            search = {
              wrap = true,
            },
            config = function(opts)
              opts.autohide = vim.fn.mode(true):find("o")
              opts.jump_labels = true
            end,
          },
        },
      },
      enabled = dots.editor.flash.enabled,
      keys = {
        { "f", mode = { "x", "n", "o" } },
        { "F", mode = { "x", "n", "o" } },
        { "t", mode = { "x", "n", "o" } },
        { "T", mode = { "x", "n", "o" } },
      },
    },
  }
