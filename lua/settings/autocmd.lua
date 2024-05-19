local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- https://www.reddit.com/r/neovim/comments/17m2a8z/comment/k7hxwt5/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
-- https://www.reddit.com/r/neovim/comments/wlkq0e/neovim_configuration_to_backup_files_with/
-- Add timestamp as extension for backup files
autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("timestamp_backupext", { clear = true }),
  desc = "Add timestamp to backup extension",
  pattern = "*",
  callback = function()
    vim.opt.backupext = "-" .. vim.fn.strftime("%Y%m%d%H%M")
  end,
})

-- reload some chadrc options on-save
autocmd("BufWritePost", {
  pattern = vim.tbl_map(function(path)
    return vim.fs.normalize(vim.loop.fs_realpath(path))
  end, vim.fn.glob(vim.fn.stdpath("config") .. "/lua/**/*.lua", true, true, true)),
  group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

  callback = function(opts)
    local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
    local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
    local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

    require("plenary.reload").reload_module("nvconfig")
    require("plenary.reload").reload_module("base46")
    require("plenary.reload").reload_module(module)

    local config = require("nvconfig")

    -- statusline
    if config.ui.statusline.theme ~= "custom" then
      require("plenary.reload").reload_module("nvchad.stl.utils")
      require("plenary.reload").reload_module("nvchad.stl." .. config.ui.statusline.theme)
      vim.opt.statusline = "%!v:lua.require('nvchad.stl." .. config.ui.statusline.theme .. "')()"
    end

    -- tabufline
    if config.ui.tabufline.enabled then
      require("plenary.reload").reload_module("nvchad.tabufline.modules")
      vim.opt.tabline = "%!v:lua.require('nvchad.tabufline.modules')()"
    end

    require("base46").load_all_highlights()
    vim.cmd("redraw!")
  end,
})
