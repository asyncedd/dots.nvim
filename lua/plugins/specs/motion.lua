return {
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion(\"w\")<CR>", mode = { "n", "v", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion(\"e\")<CR>", mode = { "n", "v", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion(\"b\")<CR>", mode = { "n", "v", "o", "x" } },
      { "ge", "<cmd>lua require('spider').motion(\"ge\")<CR>", mode = { "n", "v", "o", "x" } },
    },
  },
  {
    "ggandor/leap.nvim",
    config = function()
      -- The below settings make Leap's highlighting closer to what you've been
      -- used to in Lightspeed.

      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
      vim.api.nvim_set_hl(0, "LeapMatch", {
        -- For light themes, set to 'black' or similar.
        fg = "white", bold = true, nocombine = true,
      })
      -- Of course, specify some nicer shades instead of the default "red" and "blue".
      vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
        fg = "pink", bold = true, nocombine = true,
      })
      vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
        fg = "blue", bold = true, nocombine = true,
      })
      -- Try it without this setting first, you might find you don't even miss it.
      require("leap").opts.highlight_unlabeled_phase_one_targets = true

      require("leap").add_default_mappings()
    end,
    keys = {
      { "s", mode = { "n", "v", "x", "o" } },
      { "S", mode = { "n", "v", "x", "o" } },
      { "x", mode = { "v", "o" } },
      { "X", mode = { "v", "o" } },
      {
        "<leader>s",
        function()
          local function get_line_starts(winid)
            local wininfo =  vim.fn.getwininfo(winid)[1]
            local cur_line = vim.fn.line('.')

            -- Get targets.
            local targets = {}
            local lnum = wininfo.topline
            while lnum <= wininfo.botline do
              local fold_end = vim.fn.foldclosedend(lnum)
              -- Skip folded ranges.
              if fold_end ~= -1 then
                lnum = fold_end + 1
              else
                if lnum ~= cur_line then table.insert(targets, { pos = { lnum, 1 } }) end
                lnum = lnum + 1
              end
            end
            -- Sort them by vertical screen distance from cursor.
            local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
            local function screen_rows_from_cur(t)
              local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
              return math.abs(cur_screen_row - t_screen_row)
            end
            table.sort(targets, function (t1, t2)
              return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
            end)

            if #targets >= 1 then
              return targets
            end
          end

          -- Usage:
          local winid = vim.api.nvim_get_current_win()
          require('leap').leap {
            target_windows = { winid },
            targets = get_line_starts(winid),
          }
        end,
        mode = { "o", "v", "n" },
      },
    },
  },
  -- {
  --   "ggandor/flit.nvim",
  --   config = true,
  --   keys = {
  --     { "f", mode = { "n", "x" } },
  --     { "F", mode = { "n", "x" } },
  --     { "t", mode = { "n", "x" } },
  --     { "T", mode = { "n", "x" } },
  --   },
  --   dependencies = {
  --     "ggandor/leap.nvim",
  --   },
  -- },
  {
    "ggandor/leap-spooky.nvim",
    config = true,
    keys = {
      { "r", mode = { "n", "v", "x", "o" } },
      { "R", mode = { "n", "v", "x", "o" } },
    },
    dependencies = {
      "ggandor/leap.nvim",
    },
  },
  {
    "LeonHeidelbach/trailblazer.nvim",
    config = true,
    keys = {
      "<A-l>",
      "<A-b>",
      "<A-J>",
      "<A-K>",
      "<A-n>",
      "<A-m>",
      "<A-L>",
      "<A-p>",
      "<A-P>",
      "<A-t>",
      "<A-.>",
      "<A-,>",
      "<A-s>",
    },
  },
  {
    "jinh0/eyeliner.nvim",
    opts = {
      highlight_on_key = true, -- show highlights only after keypress
      dim = true,
    },
    config = true,
    keys = {
      { "f", mode = { "n", "x", "v", "o" } },
      { "F", mode = { "n", "x", "v", "o" } },
      { "t", mode = { "n", "x", "v", "o" } },
      { "T", mode = { "n", "x", "v", "o" } },
    },
  },
}
