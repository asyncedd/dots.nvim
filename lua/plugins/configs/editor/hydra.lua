local opts = function()
  local gitsigns = require("gitsigns")
  local git_hint = [[
  HUNK:
  _J_: next hunk _s_: stage hunk _K_: prev hunk _p_: preview hunk

  SHOW:
  _b_: blame line _B_: blame show full   _d_: show deleted

  UNDO/RESET:
  _u_: undo last stage   _r_: reset buf

  STAGE:
  _S_: stage buffer

  EXTERNAL TOOLS:
  _v_: diff view   _<Enter>_: Lazygit _g_: Lazygit

  _q_: exit _;_: exit _<Esc>_: exit
]]

  local windows_hint = [[
  MOVE:
  _<C-h>_: Right window _<C-l>_: Left window _<C-k>_: The window above _<C-j>_ The window below

  RESIZE:
  _H_:   Increase right width _L_: Increase left width _K_: Increase height _J_: Decrease height

  SWAP:
  _<leader>h_: Swap left _<leader>l_: Swap right _<leader>j_: Swap down _<leader>k_: Swap up

  CLOSE:
  _Q_: Close current window _<C-q>_: Close current window

 EQUALIZE:
  _e_: Equalize window sizes

  MAXIMIZE:
  _z_: Maximize window

 SPLIT:
  _j_: Split below _l_: Split vertically

  EXIT:
  _q_: exit _;_: exit _<Esc>_: exit
  ]]

  local lspsaga_hint = [[
  DIAGNOSTICS
  _l_: Line _b_: Buffer _w_: Workspace _s_: Cursor

  CALLS
  _i_: ingoing _o_: outgoing

  _q_: exit _;_: exit _<Esc>_: exit
  ]]

  local dap_hint = [[
  BREAKPOINT:
  _B_: Breakpoint condition _b_: Toggle breakpoint

  RUN:
  _c_: Continue _C_: Run to Cursor _pr_: Run (if a plugin provides a function)

  GO:
  _g_: Go to line (no execute)

  UP/DOWN:
  _j_: Down _k_: Up
  
  STEP:
  _i_: Step into _o_: Step out _O_: Step over

  OTHERS:
  _p_: Pause _r_: Toggle REPL _s_: session _t_: terminal _w_: widgets
  ]]

  return {
    {
      name = "Git",
      hint = git_hint,
      config = {
        buffer = true,
        color = "pink",
        invoke_on_body = true,
        hint = {
          border = "rounded",
        },
        on_enter = function()
          vim.cmd("mkview")
          vim.cmd("silent! %foldopen!")
          vim.bo.modifiable = false
          gitsigns.toggle_signs(true)
          gitsigns.toggle_linehl(true)
        end,
        on_exit = function()
          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          vim.cmd("loadview")
          vim.api.nvim_win_set_cursor(0, cursor_pos)
          vim.cmd("normal zv")
          gitsigns.toggle_linehl(false)
          gitsigns.toggle_deleted(false)
        end,
      },
      mode = { "n", "x" },
      body = "<leader>g",
      heads = {
        {
          "J",
          function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gitsigns.next_hunk()
            end)
            return "<Ignore>"
          end,
          { expr = true, desc = "next hunk" },
        },
        {
          "K",
          function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gitsigns.prev_hunk()
            end)
            return "<Ignore>"
          end,
          { expr = true, desc = "prev hunk" },
        },
        { "s", "<cmd>Gitsigns stage_hunk<CR>", { silent = true, desc = "stage hunk" } },
        { "u", gitsigns.undo_stage_hunk, { desc = "undo last stage" } },
        { "S", gitsigns.stage_buffer, { desc = "stage buffer" } },
        { "p", gitsigns.preview_hunk, { desc = "preview hunk" } },
        { "d", gitsigns.toggle_deleted, { nowait = true, desc = "toggle deleted" } },
        { "b", gitsigns.blame_line, { desc = "blame" } },
        {
          "B",
          function()
            gitsigns.blame_line({ full = true })
          end,
          { desc = "blame show full" },
        },
        { "v", "<cmd>DiffviewOpen<CR>", { exit = true, desc = "Diff view" } },
        { "r", gitsigns.reset_buffer },
        {
          "<Enter>",
          "<Cmd>lua require('core.utils.lazyvim').float_term('lazygit', { ctrl_hjkl = false, esc_esc = true })<CR>",
          { exit = true, desc = "Lazygit" },
        },
        {
          "g",
          "<Cmd>lua require('core.utils.lazyvim').float_term('lazygit', { ctrl_hjkl = false, esc_esc = true })<CR>",
          { exit = true, desc = "Lazygit" },
        },
        { "q", nil, { exit = true, nowait = true, desc = "exit" } },
        { ";", nil, { exit = true, nowait = true } },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    },
    {
      name = "Change / Resize Window",
      mode = { "n" },
      body = "<C-w>",
      hint = windows_hint,
      config = {
        hint = {
          border = "rounded",
        },
        color = "pink",
        invoke_on_body = true,
      },
      heads = {
        -- move between windows
        {
          "<C-h>",
          function()
            require("smart-splits").move_cursor_left()
          end,
        },
        {
          "<C-j>",
          function()
            require("smart-splits").move_cursor_down()
          end,
        },
        {
          "<C-k>",
          function()
            require("smart-splits").move_cursor_up()
          end,
        },
        {
          "<C-l>",
          function()
            require("smart-splits").move_cursor_right()
          end,
        },

        -- resizing window
        {
          "H",
          function()
            require("smart-splits").resize_left()
          end,
        },
        {
          "L",
          function()
            require("smart-splits").resize_right()
          end,
        },
        {
          "K",
          function()
            require("smart-splits").resize_up()
          end,
        },
        {
          "J",
          function()
            require("smart-splits").resize_down()
          end,
        },

        {
          "<leader>h",
          function()
            require("smart-splits").swap_buf_left()
          end,
        },
        {
          "<leader>l",
          function()
            require("smart-splits").swap_buf_right()
          end,
        },
        {
          "<leader>j",
          function()
            require("smart-splits").swap_buf_down()
          end,
        },
        {
          "<leader>k",
          function()
            require("smart-splits").swap_buf_up()
          end,
        },

        -- equalize window sizes
        { "e", "<cmd>WindowsEqualize<CR>" },

        { "z", "<cmd>WindowsMaximize<CR>" },

        -- close active window
        { "Q", "<cmd>q<cr>" },
        { "<C-q>", "<cmd>q<cr>" },

        -- split
        { "j", "<cmd>split<CR>" },
        { "l", "<cmd>vsplit<CR>" },

        -- exit this Hydra
        { "q", nil, { exit = true, nowait = true } },
        { ";", nil, { exit = true, nowait = true } },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    },
    {
      name = "lspsaga",
      mode = { "n" },
      hint = lspsaga_hint,
      config = {
        hint = {
          border = "rounded",
        },
        color = "pink",
        invoke_on_body = true,
      },
      body = "<leader>s",
      heads = {
        { "l", "<cmd>Lspsaga show_line_diagnostics<CR>" },
        { "b", "<cmd>Lspsaga show_buffer_diagnostics<CR>" },
        { "w", "<cmd>Lspsaga show_workspace_diagnostics<CR>" },
        { "s", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
        { "i", "<cmd>Lspsaga ingoing_calls<CR>" },
        { "o", "<cmd>Lspsaga outgoing_calls<CR>" },
        { "q", nil, { exit = true, nowait = true } },
        { ";", nil, { exit = true, nowait = true } },
        { "<Esc>", nil, { exit = true, nowait = true } },
      },
    },
    {
      name = "dap",
      mode = { "n" },
      hint = dap_hint,
      config = {
        color = "pink",
        invoke_on_body = true,
      },
      body = "<leader>d",
      heads = {
        {
          "B",
          function()
            require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
          end,
        },
        {
          "b",
          function()
            require("dap").toggle_breakpoint()
          end,
        },
        {
          "c",
          function()
            require("dap").continue()
          end,
        },
        {
          "C",
          function()
            require("dap").run_to_cursor()
          end,
        },
        {
          "g",
          function()
            require("dap").goto_()
          end,
        },
        {
          "i",
          function()
            require("dap").step_into()
          end,
        },
        {
          "j",
          function()
            require("dap").down()
          end,
        },
        {
          "k",
          function()
            require("dap").up()
          end,
        },
        {
          "l",
          function()
            require("dap").run_last()
          end,
        },
        {
          "o",
          function()
            require("dap").step_out()
          end,
        },
        {
          "O",
          function()
            require("dap").step_over()
          end,
        },
        {
          "p",
          function()
            require("dap").pause()
          end,
        },
        {
          "r",
          function()
            require("dap").repl.toggle()
          end,
        },
        {
          "s",
          function()
            require("dap").session()
          end,
        },
        {
          "t",
          function()
            require("dap").terminate()
          end,
        },
        {
          "w",
          function()
            require("dap.ui.widgets").hover()
          end,
        },
        {
          "pr",
          function()
            local ft = vim.bo.filetype

            if ft == "python" then
              require("lazy").load({ plugins = "nvim-dap-python" })
              require("dap-python").test_method()
            elseif ft == "lua" then
              require("lazy").load({ plugins = "one-small-step-for-vimkind" })
              require("osv").run_this()
            elseif ft == "go" then
              require("lazy").load({ plugins = "nvim-dap-go" })
              require("dap-go").debug_test()
            end
          end,
        },
      },
    },
  }
end

local Hydra = require("hydra")

local opt = opts()

for i, _ in ipairs(opt) do
  Hydra(opt[i])
end
