local map = vim.keymap.set

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Terminal
local openterm = function(command)
  return function()
    ---@type table<string,LazyFloat>
    local terminals = {}

    -- Opens a floating terminal (interactive by default)
    ---@param cmd? string[]|string
    ---@param opts? LazyCmdOptions|{interactive?:boolean, esc_esc?:false, ctrl_hjkl?:false}
    local function float_term(cmd, opts)
      opts = vim.tbl_deep_extend("force", {
        ft = "lazyterm",
        size = { width = 0.9, height = 0.9 },
      }, opts or {}, { persistent = true })
      ---@cast opts LazyCmdOptions|{interactive?:boolean, esc_esc?:false}

      local termkey = vim.inspect({ cmd = cmd or "shell", cwd = opts.cwd, env = opts.env, count = vim.v.count1 })

      if terminals[termkey] and terminals[termkey]:buf_valid() then
        terminals[termkey]:toggle()
      else
        terminals[termkey] = require("lazy.util").float_term(cmd, opts)
        local buf = terminals[termkey].buf
        vim.b[buf].lazyterm_cmd = cmd
        if opts.esc_esc == false then
          vim.keymap.set("t", "<esc>", "<esc>", { buffer = buf, nowait = true })
        end
        if opts.ctrl_hjkl == false then
          vim.keymap.set("t", "<c-h>", "<c-h>", { buffer = buf, nowait = true })
          vim.keymap.set("t", "<c-j>", "<c-j>", { buffer = buf, nowait = true })
          vim.keymap.set("t", "<c-k>", "<c-k>", { buffer = buf, nowait = true })
          vim.keymap.set("t", "<c-l>", "<c-l>", { buffer = buf, nowait = true })
        end

        vim.api.nvim_create_autocmd("BufEnter", {
          buffer = buf,
          callback = function()
            vim.cmd.startinsert()
          end,
        })
      end

      return terminals[termkey]
    end

    float_term(command, { ctrl_hjkl = false, esc_esc = true })
  end
end

map("n", "<leader>tt", openterm(), { desc = "Open the terminal" })
map("n", "<leader>gg", openterm("lazygit"), { desc = "Open LazyGit" })

map("n", "dd", function()
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end

  return "dd"
end, { expr = true })

map("x", "V", "j")
map("x", "v", "k")

local cache_empty_line = {}

_G.put_empty_line = function(put_above)
  -- This has a typical workflow for enabling dot-repeat:
  -- - On first call it sets `operatorfunc`, caches data, and calls
  --   `operatorfunc` on current cursor position.
  -- - On second call it performs task: puts `v:count1` empty lines
  --   above/below current line.
  if type(put_above) == "boolean" then
    vim.o.operatorfunc = "v:lua.put_empty_line"
    cache_empty_line = { put_above = put_above }
    return "g@l"
  end

  local target_line = vim.fn.line(".") - (cache_empty_line.put_above and 1 or 0)
  vim.fn.append(target_line, vim.fn["repeat"]({ "" }, vim.v.count1))
end

map("n", "gO", "v:lua.put_empty_line(v:true)", { expr = true, desc = "Put empty line above" })
map("n", "go", "v:lua.put_empty_line(v:false)", { expr = true, desc = "Put empty line below" })

map(
  "n",
  "gV",
  '"`[" . strpart(getregtype(), 0, 1) . "`]"',
  { expr = true, replace_keycodes = false, desc = "Visually select changed text" }
)

map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

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
