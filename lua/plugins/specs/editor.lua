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
        local maps = {
          { { "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" } },
          { { "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" } },
          { { "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" } },
          { { "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" } },
          {
            { "n", "o", "x" },
            "W",
            "<cmd>lua require('spider').motion('w', { skipInsignificantPunctuation = true })<CR>",
            { desc = "Spider-W" },
          },
          {
            { "n", "o", "x" },
            "E",
            "<cmd>lua require('spider').motion('e', { skipInsignificantPunctuation = true })<CR>",
            { desc = "Spider-E" },
          },
          {
            { "n", "o", "x" },
            "B",
            "<cmd>lua require('spider').motion('b', { skipInsignificantPunctuation = true } )<CR>",
            { desc = "Spider-B" },
          },
          {
            { "n", "o", "x" },
            "gB",
            "<cmd>lua require('spider').motion('ge', { skipInsignificantPunctuation = true })<CR>",
            { desc = "Spider-W" },
          },
        }

        for i, _ in ipairs(maps) do
          keymap(maps[i][1], maps[i][2], maps[i][3], maps[i][4])
        end
      end,
    },
    dots.editor.textobjs.enabled and {
      "chrisgrieser/nvim-various-textobjs",
      opts = {},
      event = "VeryLazy",
      config = function(_, opts)
        require("various-textobjs").setup(opts)
        local keymap = vim.keymap.set
        local maps = {
          {
            { "x", "o" },
            "iw",
            "<cmd>lua require('various-textobjs').subword(true)<cr>",
            { desc = "inner subword" },
          },
          {
            { "x", "o" },
            "aw",
            "<cmd>lua require('various-textobjs').subword(false)<cr>",
            { desc = "outer subword" },
          },
          {
            { "x", "o" },
            "iW",
            "<cmd>lua require('various-textobjs').subword(true)<cr>",
            { desc = "inner subword" },
          },
          {
            { "x", "o" },
            "aW",
            "<cmd>lua require('various-textobjs').subword(false)<cr>",
            { desc = "outer subword" },
          },
        }

        for i, _ in ipairs(maps) do
          keymap(maps[i][1], maps[i][2], maps[i][3], maps[i][4])
        end
      end,
    },
    dots.editor.surround.enabled and {
      "kylechui/nvim-surround",
      opts = true,
      evnet = "VeryLazy",
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
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "󰍵" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        },
      },
    },
  }
