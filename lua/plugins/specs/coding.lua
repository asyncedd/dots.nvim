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
      "ds",
      "cs",
    },
  },
}
