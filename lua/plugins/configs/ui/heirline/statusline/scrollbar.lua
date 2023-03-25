local utils = require("heirline.utils")

local M = {}

-- We're getting minimalists here!
M.Ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  provider = "%7(%l/%3L%):%2c %P",
  hl = function (self)
    return {
      fg = self:mode_color(),
      bold = true,
      bg = "normal",
    }
  end,
}

-- Thanks dharmx!

local surround = function(color, obj)
  return utils.surround({ "", "" }, color, { obj })
end

-- I take no credits for this! :lion:
M.ScrollBar = {
  static = {
    -- sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    -- Another variant, because the more choice the better.
    -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  provider = function()
    -- local curr_line = api.nvim_win_get_cursor(0)[1]
    -- local lines = api.nvim_buf_line_count(0)
    -- local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    -- -- return string.rep(self.sbar[i], 2)
    -- return string.rep(self.sbar[i], 1)
    local sbar = {
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
      position = " TOP"
    elseif position >= 95 then
      position = " BOT"
    else
      position = sbar[math.floor(line_ratio * #sbar)] .. position
    end

    return position
  end,
  -- hl = { fg = "blue", bg = "bright_bg" },
  -- hl = { fg = "blue" },
  hl = function(self)
    return {
      fg = "normal",
      bg = self.scrollbarHL(),
      -- style = "bold",
      -- bg = "bg",
    }
  end,
  -- left_sep = "block",
  -- right_sep = "block",
}

M.ScrollBar = surround(function(self)
  return self.scrollbarHL()
end, { M.ScrollBar })

return M
