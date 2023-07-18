local map = vim.keymap.set

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Code action
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Open the current buffer's code actions" })

-- Terminal
local openterm = function(command)
  return function()
    require("core.utils.lazyvim").float_term(command, { ctrl_hjkl = false, esc_esc = true })
  end
end

map("n", "<leader>tt", openterm())
map("n", "<leader>gg", openterm("lazygit"))
map("n", "<leader>g<CR>", openterm("lazygit"))

---@type table?
local id
for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
  local count = 0
  local timer = assert(vim.loop.new_timer())
  vim.keymap.set("n", key, function()
    if vim.v.count > 0 then
      count = 0
    end
    if count >= 10 then
      id = vim.notify("Hold it Cowboy!", vim.log.levels.WARN, {
        icon = "🤠",
        replace = id,
        keep = function()
          return count >= 10
        end,
      })
    else
      count = count + 1
      timer:start(2000, 0, function()
        count = 0
      end)
      return key
    end
  end, { expr = true, silent = true })
end
