return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle },
    },
    event = "BufReadPost",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gstatus",
      "Gedit",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Gmove",
      "Gdelete",
      "Gbrowse",
    },
    keys = {
      { "<leader>vf", "<cmd>G<cr>" },
    },
  },
  {
    "sbdchd/neoformat",
    event = { "BufWritePre" },
    config = function() vim.api.nvim_command("Neoformat") end,
    cmd = { "Neoformat" },
  },
}
