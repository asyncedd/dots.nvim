local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette

require("bufferline").setup({
  options = {
    -- separator_style = "slope",
    themable = true,
    numbers = "buffer_id",
    mode = "buffers",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
        s = s .. n .. sym
      end
      return s
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "Tests", -- Mandatory
          -- highlight = { underline = true, sp = "blue" }, -- Optional
          priority = 2, -- determines where it will appear relative to other groups (Optional)
          icon = "", -- Optional
          matcher = function(buf) -- Mandatory
            return buf.filename:match("%_test") or buf.filename:match("%_spec")
          end,
        },
        {
          name = "Docs",
          -- highlight = { undercurl = true, sp = "green" },
          auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.filename:match("%.md") or buf.filename:match("%.txt")
          end,
          separator = { -- Optional
            style = require("bufferline.groups").separator.tab,
          },
        },
        {
          name = "Lua",
          -- highlight = { undercurl = true, sp = "pink" },
          auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.filename:match("%.lua")
          end,
          separator = { -- Optional
            style = require("bufferline.groups").separator.tab,
          },
        },
      },
    },
    options = {
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "" }),
          -- ... -- other items
        },
      },
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true, -- use a "true" to enable the default, or set your own character
      },
    },
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

        if error ~= 0 then
          table.insert(result, { text = "  " .. error, fg = "#EC5241" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
        end
        return result
      end,
      left = function()
        return {
          { text = "  ", fg = colors.green },
        }
      end,
    },
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get({
    styles = { "italic", "bold" },
  }),
})
