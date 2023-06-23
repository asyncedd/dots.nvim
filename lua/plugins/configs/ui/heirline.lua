local utils = require("heirline.utils")
local conditions = require("heirline.conditions")
local U = require("catppuccin.utils.colors")

local M = {}

M.colors = {
  bright_bg = "#313244",
  Normal = utils.get_highlight("Normal").fg,
  bright_fg = utils.get_highlight("Folded").bg,
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
  {
    provider = " ",
    hl = function(self)
      return {
        bg = self:mode_color(),
      }
    end,
  },
  {
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
      return " %(" .. self.mode_names[self.mode] .. "%) "
    end,
    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = function(self)
      return {
        bg = self:mode_color(),
        fg = "bright_bg",
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
  },
  {
    provider = "",
    hl = function(self)
      return {
        fg = self:mode_color(),
        bg = "bright_bg",
      }
    end,
  },
  {
    condition = function()
      return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
    end,
    provider = " ",
    hl = {
      bg = "bright_bg",
    },
  },
  {
    condition = function()
      return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
    end,
    provider = " ",
    hl = { fg = "orange", bg = "bright_bg", bold = true },
    utils.surround({ "[", "]" }, nil, {
      provider = function()
        return vim.fn.reg_recording()
      end,
      hl = {
        fg = "green",
        bold = true,
        bg = "bright_bg",
      },
    }),
    update = {
      "RecordingEnter",
      "RecordingLeave",
    },
  },
  {
    provider = "  ",
    hl = function(self)
      return {
        fg = self:mode_color(),
        bg = "bright_bg",
      }
    end,
  },
  {
    provider = "",
    hl = function()
      return {
        fg = "bright_bg",
      }
    end,
  },
}

M.FileNameBlock = {
  -- init = function(self)
  --   self.filename = vim.api.nvim_buf_get_name(0)
  -- end,
}

M.FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, _ = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (" " .. self.icon .. " ")
  end,
  hl = function(self)
    return {
      bg = U.lighten(
        self:icon_color(),
        0.7,
        string.format("#%06x", vim.api.nvim_get_hl_by_name("Normal", true)["foreground"], 0.3) or 0
      ),
      fg = "bright_bg",
    }
  end,
}

M.FileName = {
  provider = function(self)
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(self.filename, ":t")
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
    return {
      bg = self:icon_color(),
      fg = "bright_bg",
    }
  end,
}

M.FileFlags = {
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "  ",
    hl = function(self)
      return {
        fg = "orange",
        bg = self:icon_color(),
      }
    end,
  },
}

-- let's add the children to our FileNameBlock component
M.FileNameBlock = utils.insert(
  M.FileNameBlock,
  utils.insert(M.FileName), -- a new table where FileName is a child of FileNameModifier
  M.FileFlags,
  {
    provider = "",
    hl = function(self)
      return {
        fg = self:icon_color(),
        bg = U.lighten(
          self:icon_color(),
          0.7,
          string.format("#%06x", vim.api.nvim_get_hl_by_name("Normal", true)["foreground"], 0.3) or 0
        ),
      }
    end,
    M.FileIcon,
  },
  { provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)

M.FileNameBlock = {
  {
    provider = "",
    hl = function(self)
      return {
        fg = self:icon_color(),
      }
    end,
  },
  M.FileNameBlock,
  {
    provider = "",
    hl = function(self)
      return {
        fg = U.lighten(
          self:icon_color(),
          0.7,
          string.format("#%06x", vim.api.nvim_get_hl_by_name("Normal", true)["foreground"], 0.3) or 0
        ),
      }
    end,
  },
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}
M.LSPActive = {
  condition = conditions.lsp_attached and function()
    return vim.g.lsp_attached
  end,
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
  hl = {
    bg = "green",
    fg = "bright_bg",
    bold = true,
  },
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
    condition = conditions.has_diagnostics,
    provider = "",
    hl = function()
      return {
        fg = "bright_bg",
      }
    end,
  },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (M.icons.Error .. self.errors .. " ")
    end,
    hl = {
      fg = "diag_error",
      bg = "bright_bg",
    },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (M.icons.Warn .. self.warnings .. " ")
    end,
    hl = {
      fg = "diag_warn",
      bg = "bright_bg",
    },
  },
  {
    provider = function(self)
      return self.info > 0 and (M.icons.Info .. self.info .. " ")
    end,
    hl = {
      fg = "diag_info",
      bg = "bright_bg",
    },
  },
  {
    provider = function(self)
      return self.hints > 0 and (M.icons.Hint .. self.hints .. " ")
    end,
    hl = {
      fg = "diag_hint",
      bg = "bright_bg",
    },
  },
}

M.LSP = {
  condition = conditions.lsp_attached and function()
    return vim.g.lsp_attached
  end or conditions.has_diagnostics,
  M.Diagnostics,
  {
    provider = "",
    hl = function(self)
      local bg
      if self.errors or self.warnings or self.info or self.hints then
        bg = "bright_bg"
      end
      return {
        fg = "green",
        bg = bg,
      }
    end,
  },
  M.LSPActive,
  {
    provider = "",
    hl = function()
      return {
        fg = "green",
      }
    end,
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
    provider = "",
    hl = { fg = "orange" },
  },
  {
    -- git branch name
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = {
      bold = true,
      fg = "bright_bg",
      bg = "orange",
    },
  },
  {
    provider = "",
    hl = function(self)
      local bg

      if self.has_changes then
        bg = "bright_bg"
      end

      return {
        fg = "orange",
        bg = bg,
      }
    end,
  },
  {
    condition = function(self)
      return self.status_dict.added or false
    end,
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (" " .. " " .. count)
    end,
    hl = {
      fg = "git_add",
      bg = "bright_bg",
    },
  },
  {
    condition = function(self)
      return self.status_dict.removed or false
    end,
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (" " .. " " .. count)
    end,
    hl = {
      fg = "git_del",
      bg = "bright_bg",
    },
  },
  {
    condition = function(self)
      return self.status_dict.changed or false
    end,
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (" " .. " " .. count)
    end,
    hl = {
      fg = "git_change",
      bg = "bright_bg",
    },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "",
    hl = {
      fg = "bright_bg",
    },
  },
}

M.Scrollbar = {
  init = function(self)
    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
    local fg

    if position <= 5 then
      fg = "blue"
    elseif position >= 95 then
      fg = "red"
    else
      fg = "purple"
    end

    self.scroll_color = fg
  end,
  {
    provider = "",
    hl = function(self)
      return {
        fg = self.scroll_color,
      }
    end,
  },
  {
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
    hl = function(self)
      return {
        bg = self.scroll_color,
        fg = "bright_bg",
        bold = true,
      }
    end,
  },
  {
    provider = "",
    hl = function(self)
      return {
        fg = self.scroll_color,
      }
    end,
  },
}

M.StatusLine = {
  M.ViMode,
  M.Space,
  M.Space,
  M.FileNameBlock,
  M.Space,
  M.Space,
  M.Git,
  M.Align,
  M.LSP,
  M.Space,
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
    icon_color = function(self)
      local filename = self.filename
      local extension = vim.fn.fnamemodify(filename, ":e")
      local _, icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

      return icon_color
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

vim.schedule(function()
  local setup_colors = function()
    return M.colors
  end
  vim.api.nvim_create_augroup("Heirline", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      utils.on_colorscheme(setup_colors)
    end,
    group = "Heirline",
  })
end)

return {
  opts = {
    colors = M.colors,
  },
  statusline = M.StatusLines,
}
