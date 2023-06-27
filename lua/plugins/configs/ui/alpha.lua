local C = require("catppuccin.palettes").get_palette()
local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")

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

local colors = {
  {
    StartLogo1 = { fg = C.red },
    StartLogo2 = { fg = C.red },
    StartLogo3 = { fg = C.peach },
    StartLogo4 = { fg = C.yellow },
    StartLogo5 = { fg = C.green },
    StartLogo6 = { fg = C.teal },
    StartLogo7 = { fg = C.sapphire },
    StartLogo8 = { fg = C.blue },
  },
  {
    StartLogo1 = { fg = C.blue },
    StartLogo2 = { fg = C.blue },
    StartLogo3 = { fg = C.blue },
    StartLogo4 = { fg = C.blue },
    StartLogo5 = { fg = C.blue },
    StartLogo6 = { fg = C.yellow },
    StartLogo7 = { fg = C.yellow },
    StartLogo8 = { fg = C.yellow },
  },
  {
    StartLogo1 = { fg = "#94E2D5" },
    StartLogo2 = { fg = "#A2DDD8" },
    StartLogo3 = { fg = "#B0D9DA" },
    StartLogo4 = { fg = "#BED4DD" },
    StartLogo5 = { fg = "#CBD0DF" },
    StartLogo6 = { fg = "#D9CBE2" },
    StartLogo7 = { fg = "#E7C7E4" },
    StartLogo8 = { fg = "#F5C2E7" },
  },
}

math.randomseed(os.time() * os.time())

require("catppuccin.lib.highlighter").syntax(colors[math.random(1, #colors)])

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
  {
    type = "text",
    val = "[ ━━━━━━  ❖  ━━━━━━ ]",
    opts = { hl = "SpecialComment", position = "center" },
  },
  { type = "padding", val = 1 },
  dashboard.button("p", "  Load latest session", "<cmd>SessionLoad<CR>"),
  dashboard.button("e", "  Scratch File", "<cmd>ene | startinsert <CR>"),
  dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
  dashboard.button("g", "  Find word", "<cmd>Telescope live_grep<CR>"),
  dashboard.button(
    "l",
    "  Open Lazygit",
    "<cmd>lua require('core.utils.lazyvim').float_term('lazygit', { ctrl_hjkl = false, esc_esc = true })<CR>"
  ),
  dashboard.button("s", "󰒲  Sync Lazy.nvim", "<cmd>Lazy sync<CR>"),
  dashboard.button("q", "󰩈  Quit NVIM", "<cmd>qa<CR>"),
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
    vim.opt.laststatus = 0
  end,
})

vim.api.nvim_create_autocmd("BufUnload", {
  group = group,
  pattern = "<buffer>",
  callback = function()
    vim.opt.laststatus = 3
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
