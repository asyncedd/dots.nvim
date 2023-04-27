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
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    keys = {
      "ys",
      "yss",
      "ds",
      "cs",
      "yS",
      "ySS",
      { "S", mode = { "v", "x" } },
      { "gS", mode = { "v", "x" } },
      { "<C-g>s", mode = "i" },
      { "<C-g>S", mode = "i" },
    },
  },
}
