if not vim.g.vscode then
  return {}
end

local enabled = {
  "flash.nvim",
  "lazy.nvim",
  "mini.ai",
  "mini.operators",
  "Comment.nvim",
  "ultimate-autopair.nvim",
  "nvim-surround",
  "mini.indentscope",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "vim-repeat",
  "nvim-spider",
  "treesj",
  "substitute.nvim",
  "duplicate.nvim",
  "nvim-ts-autotag",
}

local Config = require("lazy.core.config").options
Config.checker.enabled = false
Config.change_detection.enabled = false
Config.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
  end,
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
