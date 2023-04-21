local utils = require("heirline.utils")
local FileIcon = require("plugins.configs.ui.heirline.filename").FileIcon

local TablineBufnr = {
  provider = function(self)
    return tostring(self.bufnr) .. ". "
  end,
  hl = "Comment",
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
local TablineFileName = {
  provider = function(self)
    -- self.filename will be defined later, just keep looking at the example!
    local filename = self.filename
    filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
    return filename
  end,
  hl = function(self)
    return { bold = self.is_active or self.is_visible, italic = true }
  end,
}

-- this looks exactly like the FileFlags component that we saw in
-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
-- also, we are adding a nice icon for terminal buffers.
local TablineFileFlags = {
  {
    condition = function(self)
      return vim.api.nvim_buf_get_option(self.bufnr, "modified")
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function(self)
      return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
        or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
    end,
    provider = function(self)
      if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
        return "  "
      else
        return ""
      end
    end,
    hl = { fg = "orange" },
  },
}

-- Here the filename block finally comes together
local TablineFileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self.bufnr)
  end,
  hl = function(self)
    if self.is_active then
      return "TabLineSel"
      -- why not?
      -- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
      --     return { fg = "gray" }
    else
      return "TabLine"
    end
  end,
  on_click = {
    callback = function(_, minwid, _, button)
  if (button == "m") then -- close on mouse middle click
        vim.api.nvim_buf_delete(minwid, {force = false})
      else
        vim.api.nvim_win_set_buf(0, minwid)
      end
end,
    minwid = function(self)
  return self.bufnr
    end,
    name = "heirline_tabline_buffer_callback",
  },
  TablineBufnr,
  FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
TablineFileName,
  TablineFileFlags,
}

-- a nice "x" button to close the buffer
local TablineCloseButton = {
  condition = function(self)
    return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
  end,
  { provider = " " },
  {
    provider = "",
    hl = { fg = "gray" },
    on_click = {
      callback = function(_, minwid)
  vim.api.nvim_buf_delete(minwid, { force = false })
      end,
      minwid = function(self)
  return self.bufnr
      end,
      name = "heirline_tabline_close_buffer_callback",
    },
  },
}


local TablinePicker = {
  condition = function(self)
    return self._show_picker
  end,
  init = function(self)
    local bufname = vim.api.nvim_buf_get_name(self.bufnr)
    bufname = vim.fn.fnamemodify(bufname, ":t")
    local label = bufname:sub(1, 1)
    local i = 2
    while self._picker_labels[label] do
      if i > #bufname then
        break
      end
      label = bufname:sub(i, i)
      i = i + 1
    end
    self._picker_labels[label] = self.bufnr
    self.label = label
  end,
  provider = function(self)
    return self.label
  end,
  hl = { fg = "red", bold = true },
}

vim.keymap.set("n", "gbp", function()
  local tabline = require("heirline").tabline
  local buflist = tabline._buflist[1]
  buflist._picker_labels = {}
  buflist._show_picker = true
  vim.cmd.redrawtabline()
  local char = vim.fn.getcharstr()
  local bufnr = buflist._picker_labels[char]
  if bufnr then
    vim.api.nvim_win_set_buf(0, bufnr)
  end
  buflist._show_picker = false
  vim.cmd.redrawtabline()
end)



-- The final touch!
local TablineBufferBlock = utils.surround({ "", "" }, function(self)
  if self.is_active then
    return utils.get_highlight("TabLineSel").bg
  else
    return utils.get_highlight("TabLine").bg
  end
end, { TablineFileNameBlock, TablineCloseButton, TablinePicker })

-- and here we go
-- local BufferLine = utils.make_buflist(
--   TablineBufferBlock,
--   { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
--   { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
--   -- by the way, open a lot of buffers and try clicking them ;)
-- )

-- this is the default function used to retrieve buffers
local get_bufs = function()
    return vim.tbl_filter(function(bufnr)
        return vim.api.nvim_buf_get_option(bufnr, "buflisted")
    end, vim.api.nvim_list_bufs())
end

-- initialize the buflist cache
local buflist_cache = {}

-- setup an autocmd that updates the buflist_cache every time that buffers are added/removed
vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
    callback = function()
        vim.schedule(function()
            local buffers = get_bufs()
            for i, v in ipairs(buffers) do
                buflist_cache[i] = v
            end
            for i = #buffers + 1, #buflist_cache do
                buflist_cache[i] = nil
            end

            -- check how many buffers we have and set showtabline accordingly
            if #buflist_cache > 1 then
                vim.o.showtabline = 2 -- always
            else
                vim.o.showtabline = 1 -- only when #tabpages > 1
            end
        end)
    end,
})

local BufferLine = utils.make_buflist(
  TablineBufferBlock,
  { provider = " ", hl = { fg = "gray" } },
  { provider = " ", hl = { fg = "gray" } },
  -- out buf_func simply returns the buflist_cache
  function()
    return buflist_cache
  end,
  -- no cache, as we're handling everything ourselves
  false
)

return BufferLine
