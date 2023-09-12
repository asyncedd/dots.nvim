return {
  {
    "altermo/ultimate-autopair.nvim",
    opts = {
      bs = {
        indent_ignore = true,
      },
    },
    event = {
      "InsertEnter",
      "CmdlineEnter"
    },
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      filetypes = {
	"html",
	"xml",
	"svelte"
      },
    },
    event = {
      "InsertEnter",
    },
  },
}
