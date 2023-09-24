vim.loader.enable()

require("settings")
require("settings.options")
require("settings.keymap")
require("settings.autocmd")
require("plugins")

vim.cmd("colorscheme " .. (vim.g.vscode and "habamax" or dots.UI.colorscheme.name))

local function bootstrap(url, ref)
  local name = url:gsub(".*/", "")
  local path

  path = vim.fn.stdpath("data") .. "/lazy/" .. name
  vim.opt.rtp:prepend(path)

  if vim.fn.isdirectory(path) == 0 then
    print(name .. ": installing in data dir...")

    vim.fn.system({ "git", "clone", url, path })
    if ref then
      vim.fn.system({ "git", "-C", path, "checkout", ref })
    end

    vim.cmd("redraw")
    print(name .. ": finished installing")
  end
end

-- for git head
bootstrap("https://github.com/udayvir-singh/tangerine.nvim")

require("tangerine").setup({})
