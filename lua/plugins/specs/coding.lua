return {
  {
    "altermo/npairs-integrate-upair",
    dependencies = {
      {
        "altermo/ultimate-autopair.nvim",
      },
      "windwp/nvim-autopairs"
    },
    config = function()
      require("coding.autopairs")
    end,
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "kylechui/nvim-surround",
    opts = {
      keymaps = {
        normal = "<leader>ys",
        normal_cur = "<leader>yss",
        normal_line = "<leader>yS",
        normal_cur_line = "<leader>ySS",
        visual = "<leader>S",
        visual_line = "<leader>gS",
        delete = "<leader>ds",
        change = "<leader>cs",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    keys = {
      "<leader>ys",
      "<leader>yss",
      "<leader>ds",
      "<leader>cs",
      "<leader>yS",
      "<leader>ySS",
      { "<leader>S", mode = { "v", "x" } },
      { "<leader>gS", mode = { "v", "x" } },
      { "<C-g>s", mode = "i" },
      { "<C-g>S", mode = "i" },
    },
  },
}
