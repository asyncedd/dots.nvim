-- ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
-- ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
-- ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
-- ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
-- ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

vim.loader.enable()

require("settings.options")

require("settings.autocmd")

local config = vim.fn.stdpath("config")

-- Allow searching in `lua/plugins/configs/x.lua` or `lua/plugins/configs/x/init.lua`
package.path = config .. "/lua/plugins/configs/?.lua;" .. config .. "/lua/plugins/configs/?/init.lua;" .. package.path

require("plugins")

local colorschemes = {
  "catppuccin-mocha",
  -- "catppuccin-latte",
  "catppuccin-frappe",
  "catppuccin-macchiato",
  "tokyonight-storm",
  "tokyonight-night",
  "tokyonight-moon",
}

math.randomseed(os.time())

local scheme = colorschemes[math.random(#colorschemes)]

if scheme:find("^catppuccin") ~= nil then
  vim.g.colorscheme = "catppuccin"
elseif scheme:find("^tokyonight") ~= nil then
  vim.g.colorscheme = "tokyonight"
end

vim.api.nvim_command("colorscheme " .. scheme)

vim.schedule(function()
  require("core.after")
end)
