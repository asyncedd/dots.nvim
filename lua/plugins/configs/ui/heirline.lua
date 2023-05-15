local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local M = {}

M.colors = {
  bright_bg = utils.get_highlight("Folded").bg,
  bright_fg = utils.get_highlight("Folded").fg,
  red = utils.get_highlight("DiagnosticError").fg,
  dark_red = utils.get_highlight("DiffDelete").bg,
  green = utils.get_highlight("String").fg,
  blue = utils.get_highlight("Function").fg,
  gray = utils.get_highlight("NonText").fg,
  orange = utils.get_highlight("Constant").fg,
  purple = utils.get_highlight("Statement").fg,
  cyan = utils.get_highlight("Special").fg,
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
  git_del = utils.get_highlight("diffRemoved").fg,
  git_add = utils.get_highlight("diffAdded").fg,
  git_change = utils.get_highlight("diffChanged").fg,
}

local function setup_colors()
  return M.colors
end

-- require("heirline").load_colors(setup_colors)
-- or pass it to config.opts.colors

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    utils.on_colorscheme(setup_colors)
  end,
  group = "Heirline",
})

M.null_ls_providers = function(filetype)
  local registered = {}
  -- try to load null-ls
  local sources_avail, sources = pcall(require, "null-ls.sources")
  if sources_avail then
    -- get the available sources of a given filetype
    for _, source in ipairs(sources.get_available(filetype)) do
      -- get each source name
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
  end
  -- return the found null-ls sources
  return registered
end

M.null_ls_sources = function(filetype, method)
  local methods_avail, methods = pcall(require, "null-ls.methods")
  return methods_avail and M.null_ls_providers(filetype)[methods.internal[method]] or {}
end

M.Space = { provider = " " }

M.Align = { provider = "%=" }

M.ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      -- change the strings if you like it vvvvverbose!
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
  },
  provider = function(self)
    return " %2(" .. self.mode_names[self.mode] .. "%)"
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    return {
      bg = self:mode_color(),
      bold = true,
    }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- Also allows the statusline to be re-evaluated when entering operator-pending mode
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}

M.ViMode = utils.surround({ "", "" }, function(self)
  return self:mode_color()
end, { M.ViMode, hl = { fg = "black" } })

M.FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

M.FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

M.FileName = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return "[Scratch]"
    end
    -- now, if the filename would occupy more than 1/4th of the available
    -- space, we trim the file path to its initials
    -- See Flexible Components section below for dynamic truncation
    filename = vim.fn.pathshorten(filename)
    return filename
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

M.FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "  ",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "  ",
    hl = { fg = "orange" },
  },
}

M.WorkDir = {
  provider = function()
    local icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
    local cwd = vim.fn.getcwd(0)
    cwd = vim.fn.fnamemodify(cwd, ":~")
    if not conditions.width_percent_below(#cwd, 0.25) then
      cwd = vim.fn.pathshorten(cwd)
    end
    local trail = cwd:sub(-1) == "/" and "" or "/"
    return icon .. cwd .. trail
  end,
  hl = { fg = "blue", bold = true },
}

-- let's add the children to our FileNameBlock component
M.FileNameBlock = utils.insert(
  M.FileNameBlock,
  M.FileIcon,
  utils.insert(M.FileName), -- a new table where FileName is a child of FileNameModifier
  M.FileFlags,
  { provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)

M.Scrollbar = {
  provider = function()
    local chars = {
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
    }
    local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
    local position = math.floor(line_ratio * 100)

    if position <= 5 then
      return " TOP"
    elseif position >= 95 then
      return " BOT"
    else
      return chars[math.floor(line_ratio * #chars)] .. position
    end
  end,
  hl = function()
    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
    local fg

    if position <= 5 then
      fg = "aqua"
    elseif position >= 95 then
      fg = "red"
    else
      fg = "purple"
    end

    return {
      fg = fg,
      bold = true,
    }
  end,
}

M.LSPActive = {
  condition = conditions.lsp_attached,
  update = {
    "LspAttach",
    "LspDetach",
  },

  provider = function(self)
    local buf_client_names = {}
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = self and self.bufnr or 0 })) do
      if client.name == "null-ls" then
        local nullls_sources = {}
        for _, type in ipairs({ "FORMATTING", "DIAGNOSTICS" }) do
          for _, source in ipairs(M.null_ls_sources(vim.bo.filetype, type)) do
            nullls_sources[source] = true
          end
        end
        vim.list_extend(buf_client_names, vim.tbl_keys(nullls_sources))
      else
        table.insert(buf_client_names, client.name)
      end
    end
    return " " .. table.concat(buf_client_names, ", ")
  end,
  hl = { fg = "green", bold = true },
  on_click = {
    callback = function()
      vim.defer_fn(function()
        vim.cmd("LspInfo")
      end, 100)
    end,
    name = "heirline_LSP",
  },
}

M.icons = require("core.utils.icons")

M.Diagnostics = {
  condition = conditions.has_diagnostics,

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "LspAttach" },

  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (M.icons.Error .. self.errors .. " ")
    end,
    hl = { fg = "diag_error" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (M.icons.Warn .. self.warnings .. " ")
    end,
    hl = { fg = "diag_warn" },
  },
  {
    provider = function(self)
      return self.info > 0 and (M.icons.Info .. self.info .. " ")
    end,
    hl = { fg = "diag_info" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (M.icons.Hint .. self.hints)
    end,
    hl = { fg = "diag_hint" },
  },
}

M.Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "orange" },

  {
    -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head .. " "
    end,
    hl = { bold = true },
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" " .. count .. " ")
    end,
    hl = { fg = "git_add" },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" " .. count .. " ")
    end,
    hl = { fg = "git_del" },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" " .. count .. " ")
    end,
    hl = { fg = "git_change" },
  },
}

M.wpm = {
  condition = function()
    return true
  end,
  provider = function()
    local wpm = require("wpm")
    return "WPM: " .. wpm.wpm() .. " | " .. wpm.historic_graph()
  end,
  hl = function(self)
    return {
      fg = self:mode_color(),
    }
  end,
  update = { "InsertCharPre", "ModeChanged" },
}

M.StatusLine = {
  M.ViMode,
  M.Space,
  M.WorkDir,
  M.Space,
  M.FileNameBlock,
  M.Space,
  M.Git,
  M.Align,
  M.LSPActive,
  M.Space,
  M.Diagnostics,
  M.Space,
  M.wpm,
  M.Space,
  M.Scrollbar,
}

local C = require("catppuccin.palettes").get_palette()

M.StatusLines = {
  static = {
    mode_colors_map = {
      n = C.blue,
      i = C.green,
      v = C.pink,
      V = C.pink,
      ["\22"] = C.pink,
      c = C.yellow,
      s = C.mauve,
      S = C.mauve,
      ["\19"] = C.mauve,
      R = C.maroon,
      r = C.maroon,
      ["!"] = "red",
      t = C.green,
    },
    mode_color = function(self)
      local mode = conditions.is_active() and vim.fn.mode() or "n"
      return self.mode_colors_map[mode]
    end,
  },
  hl = function()
    if conditions.is_active() then
      return "Normal"
    else
      return "StatusLineNC"
    end
  end,

  M.StatusLine,
}

return {
  opts = {
    colors = M.colors,
  },
  statusline = M.StatusLines,
}
