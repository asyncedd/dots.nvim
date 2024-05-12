return {
  {
    "kkharji/sqlite.lua",
    config = function()
      if dots.sqlite.path then
        vim.g.sqlite_clib_path = dots.sqlite.path .. "/lib/libsqlite3.so"
      end
    end,
  },
  {
    "echasnovski/mini.pick",
    opts = {
      window = {
        config = {
          border = "solid",
        },
      },
      options = {
        use_cache = true,
      },
    },
    keys = {
      {
        "<leader>ff",
        "<cmd>Pick files<CR>",
      },
      {
        "<leader>fg",
        "<cmd>Pick grep_live<CR>",
      },
      {
        "<leader>fb",
        "<cmd>Pick buffers<CR>",
      },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
      },
    },
    keys = {
      { "<leader>to", "<cmd>lua require('mini.files').open()<CR>", desc = "mini.files: Open" },
    },
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("mini.files")
        end
      end
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesWindowOpen",
        callback = function(args)
          local win_id = args.data.win_id

          vim.api.nvim_win_set_config(win_id, { border = "solid" })
        end,
      })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    opts = true,
    keys = {
      { "<leader>s", "<Cmd>lua require('spectre').toggle()<CR>", desc = "Spectre: toggle" },
    },
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      win_opts = {
        border = "solid",
      },
    },
    keys = {
      {
        "<leader>ga",
        "<cmd>Grapple toggle<CR>",
        desc = "Grapple: Toggle",
      },
      {
        "<leader>gt",
        "<cmd>Grapple open_tags<CR>",
        desc = "Grapple: Open Tags",
      },
      {
        "<leader>gs",
        "<cmd>Grapple open_scopes<CR>",
        desc = "Grapple: Open scopes",
      },
      {
        "<leader>gl",
        "<cmd>Grapple open_loaded<CR>",
        desc = "Grapple: Open loaded",
      },
    },
    cmd = {
      "Grapple",
    },
  },
}
