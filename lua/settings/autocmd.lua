local autocmd = vim.api.nvim_create_autocmd

-- REMEMBER FOLDS (AND CURSOR LOCATION)
local function remember(mode)
	-- stylua: ignore
	local ignoredFts = { "TelescopePrompt", "DressingSelect", "DressingInput", "toggleterm", "gitcommit", "replacer", "harpoon", "help", "qf" }
  if vim.tbl_contains(ignoredFts, vim.bo.filetype) or vim.bo.buftype ~= "" or not vim.bo.modifiable then
    return
  end
  if mode == "save" then
    vim.cmd.mkview(1)
  else
    pcall(function()
      vim.cmd.loadview(1)
    end)
  end
end

autocmd("BufWinLeave", {
  pattern = "?*",
  callback = function()
    remember("save")
  end,
})
autocmd("BufWinEnter", {
  pattern = "?*",
  callback = function()
    remember("load")
  end,
})
