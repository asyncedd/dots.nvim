-- https://github.com/b0o/incline.nvim/discussions/31

local icons = require("core.utils.icons")

local function get_diagnostic_label(props)
  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
    end
  end
  return label
end

return {
  debounce_threshold = { falling = 500, rising = 250 },
  render = function(props)
    if not props.focused then
      return ""
    end

    local count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
    local contents = vim.fn.getreg("/")
    if string.len(contents) == 0 then
      return ""
    end

    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    local diagnostics = get_diagnostic_label(props)
    local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

    local function get_git_diff()
      local git_icon = {
        removed = "",
        changed = "",
        added = "",
      }
      local labels = {}
      local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
      -- local signs = vim.b.gitsigns_status_dict
      for name, icon in pairs(git_icon) do
        if tonumber(signs[name]) and signs[name] > 0 then
          table.insert(labels, {
            icon .. " " .. signs[name] .. " ",
            group = "Diff" .. name,
          })
        end
      end
      if #labels > 0 then
        table.insert(labels, { "| " })
      end
      return labels
    end

    local buffer = {
      -- https://github.com/davidosomething/dotfiles/issues/498#issuecomment-1458400313
      {
        " ? ",
        group = "dkoStatusKey",
      },
      {
        (" %s "):format(contents),
        group = "IncSearch",
      },
      {
        (" %d/%d "):format(count.current, count.total),
        group = "dkoStatusValue",
      },
      { " " },
      { get_git_diff() },
      { " " },
      { filetype_icon, guifg = color },
      { " " },
      { filename, gui = modified },
    }

    if #diagnostics > 0 then
      table.insert({ "| ", guifg = "grey" }, diagnostics)
    end
    for _, buffer_ in ipairs(buffer) do
      table.insert(diagnostics, buffer_)
    end
    return diagnostics
  end,
  window = {
    margin = { horizontal = 0 },
    padding = 0,
  },
}
