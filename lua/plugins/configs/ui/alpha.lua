local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")
local colors = require("catppuccin.palettes").get_palette()

require("catppuccin.lib.highlighter").syntax({
  StartLogo1 = { fg = colors.pink },
  StartLogo2 = { fg = colors.red },
  StartLogo3 = { fg = colors.peach },
  StartLogo4 = { fg = colors.yellow },
  StartLogo5 = { fg = colors.green },
  StartLogo6 = { fg = colors.sapphire },
  StartLogo7 = { fg = colors.lavender },
  StartLogo8 = { fg = colors.mauve },
})

-- Inspired by https://github.com/glepnir/dashboard-nvim with my own flair
local header = {
  [[                                                                   ]],
  [[      ████ ██████           █████      ██                    ]],
  [[     ███████████             █████                            ]],
  [[     █████████ ███████████████████ ███   ███████████  ]],
  [[    █████████  ███    █████████████ █████ ██████████████  ]],
  [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
  [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
  [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
}

-- Make the header a bit more fun with some color!
local function colorize_header()
  local lines = {}

  for i, chars in pairs(header) do
    local line = {
      type = "text",
      val = chars,
      opts = {
        hl = "StartLogo" .. i,
        shrink_margin = false,
        position = "center",
      },
    }

    table.insert(lines, line)
  end

  return lines
end

dashboard.section.buttons.val = {
  { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
  { type = "padding", val = 1 },
  dashboard.button("e", "  New file", ":ene | startinsert <CR>"),
  dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("g", "  Find word", ":Telescope live_grep<CR>"),
  dashboard.button("t", "  Open Neogit", ":Neogit<CR>"),
  dashboard.button("l", "󰒲  Open Lazygit", ":LazyGit<CR>"),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

-- Everyone could use a good fortune cookie from time to time, right?
dashboard.section.footer.val = fortune()

-- Hide all the unnecessary visual elements while on the dashboard, and add
-- them back when leaving the dashboard.
local group = vim.api.nvim_create_augroup("CleanDashboard", {})

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "AlphaReady",
  callback = function()
    vim.opt.showtabline = 0
    vim.opt.showmode = false
    vim.opt.laststatus = 0
    vim.opt.showcmd = false
    vim.opt.ruler = false
  end,
})

vim.api.nvim_create_autocmd("BufUnload", {
  group = group,
  pattern = "<buffer>",
  callback = function()
    vim.opt.showtabline = 2
    vim.opt.showmode = true
    vim.opt.laststatus = 3
    vim.opt.showcmd = true
    vim.opt.ruler = true
  end,
})

return {
  layout = {
    { type = "padding", val = 4 },
    { type = "group", val = colorize_header() },
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    dashboard.section.footer,
  },
  opts = { margin = 5 },
}
