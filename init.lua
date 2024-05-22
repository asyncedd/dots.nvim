vim.loader.enable()
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"

require("settings")
require("settings.options")
require("settings.autocmd")
require("plugins")
require("settings.keymap")

-- This autocmd will only trigger when a file was loaded from the cmdline.
-- It will render the file as quickly as possible.
vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function(event)
    -- Skip if we already entered vim
    if vim.v.vim_did_enter == 1 then
      return
    end

    -- Try to guess the filetype (may change later on during Neovim startup)
    local ft = vim.filetype.match({ buf = event.buf })
    if ft then
      -- Add treesitter highlights and fallback to syntax
      local lang = vim.treesitter.language.get_lang(ft)
      if not (lang and pcall(vim.treesitter.start, event.buf, lang)) then
        vim.bo[event.buf].syntax = ft
      end

      -- Trigger early redraw
      vim.cmd([[redraw]])
    end
  end,
})

for name, icon in pairs(dots.UI.icons.LSP.diagnostics) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

-- https://www.reddit.com/r/neovim/comments/1ayx62p/config_for_diagnostics/
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
  },
})

vim.filetype.add({
  extension = {
    postcss = "css",
  },
})

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
