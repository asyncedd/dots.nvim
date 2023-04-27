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
        normal = "gys",
        normal_cur = "gyss",
        normal_line = "gyS",
        normal_cur_line = "gySS",
        visual = "gS",
        visual_line = "ggS",
        delete = "gds",
        change = "gcs",
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    keys = {
      "gys",
      "gyss",
      "gds",
      "gcs",
      "gyS",
      "gySS",
      { "gS", mode = { "v", "x" } },
      { "ggS", mode = { "v", "x" } },
      { "<C-g>s", mode = "i" },
      { "<C-g>S", mode = "i" },
    },
  },
}
