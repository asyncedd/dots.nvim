local map = vim.keymap.set
local opts = { noremap = true, silent = true }

require("asyncedd.cowboy")()

-- better up/down
-- map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

if not vim.g.vscode then
  map("n", "<leader>tt", function()
    require("utils.float_term")(nil, { ctrl_hjkl = false })
  end, { desc = "Open the terminal" })
  map("n", "<leader>gg", function()
    require("utils.float_term")("lazygit", { ctrl_hjkl = false })
  end, { desc = "Open LazyGit" })
end

map("n", "dd", function()
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end

  return "dd"
end, { expr = true })

map(
  "n",
  "gV",
  '"`[" . strpart(getregtype(), 0, 1) . "`]"',
  { expr = true, replace_keycodes = false, desc = "Visually select changed text" }
)

map({ "x", "o" }, "gG", function()
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
  if not vim.fn.mode():find("V") ~= nil then
    vim.cmd("normal! V")
  end
  vim.cmd("normal! o")
  vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })
end)

map("n", "[d", function()
  vim.diagnostic.goto_prev()
end, { desc = "Prev diagnostic" })
map("n", "]d", function()
  vim.diagnostic.goto_next()
end, { desc = "Next diagnostic" })

-- Clear search with <esc>
map("n", "<esc>", "<cmd>noh<CR>", { desc = "Escape and clear hlsearch" })
