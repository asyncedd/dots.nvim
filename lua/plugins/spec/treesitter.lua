return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.configs.editor.treesitter")
    end,
    dependencies = {
      "David-Kunz/markid",
    },
    event = "BufReadPost",
  },
}
