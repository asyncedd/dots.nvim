return {
  {
    "altermo/npairs-integrate-upair",
    dependencies = {
      {
        "altermo/ultimate-autopair.nvim",
        branch = "v0.5.0-pre-alpha",
      },
      "windwp/nvim-autopairs"
    },
    config = function()
      require("coding.autopairs")
    end,
    event = { "InsertEnter", "CmdlineEnter" },
  },
}
