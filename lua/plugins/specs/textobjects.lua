return {
  {
    "echasnovski/mini.ai",
    opts = function()
      local ai = require("mini.ai")

      return {
        n_lines = 500,
        custom_textobjects = {
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),
          s = ai.gen_spec.treesitter({ a = "@scope", i = "@scope.inner" }, {}),
          [","] = ai.gen_spec.argument(),
        },
        search_method = "cover_or_next",
      }
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter-textobjects",
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    keys = {
      {
        "aw",
        "<cmd>lua require('various-textobjs').subword(false)<CR>",
        mode = { "o", "x" },
      },
      {
        "iw",
        "<cmd>lua require('various-textobjs').subword(true)<CR>",
        mode = { "o", "x" },
      },
      {
        "gG",
        "<cmd>lua require('various-textobjs').entireBuffer()<CR>",
        mode = { "o", "x" },
        desc = "Select entire buffer",
      },
      {
        "gW",
        "<cmd>lua require('various-textobjs').visibleInWindow()<CR>",
        mode = { "o", "x" },
        desc = "Select the current visible area",
      },
      {
        "i_",
        "<cmd>lua require('various-textobjs').lineCharacterwise(true)<CR>",
        mode = { "o", "x" },
        desc = "Select inner line Characterwise",
      },
      {
        "a_",
        "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>",
        mode = { "o", "x" },
        desc = "Select around line Characterwise",
      },
    },
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    opts = {
      textsubjects = {
        enable = true,
        prev_selection = ",", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["."] = "textsubjects-smart",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      -- PERF: no need to load the plugin, if we only need its queries for mini.ai
      local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local enabled = false
      if opts.textobjects then
        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
          if opts.textobjects[mod] and opts.textobjects[mod].enable then
            enabled = true
            break
          end
        end
      end
      if not enabled then
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
      end
    end,
  },
  {
    "smjonas/duplicate.nvim",
    opts = true,
    keys = {
      "yd",
      "ydd",
    },
  },
}
