return function(winid, dir)
  local wininfo = vim.fn.getwininfo(winid)[1]
  local cur_line = vim.fn.line "."

  local function update_lnum(lnum)
    if dir == "down" then
      return lnum - 1
    end

    if dir == "up" then
      return lnum + 1
    end
  end

  local function loop_condition(lnum)
    if dir == "down" then
      return lnum >= wininfo.topline
    end
    if dir == "up" then
      return lnum <= wininfo.botline
    end
  end

  -- Get targets.
  local targets = {}
  local lnum = vim.fn.line "."
  while loop_condition(lnum) do
    local fold_end = vim.fn.foldclosedend(lnum)
    -- Skip folded ranges.
    if fold_end ~= -1 then
      lnum = fold_end + 1
    else
      if lnum ~= cur_line then
        table.insert(targets, { pos = { lnum, 1 } })
      end
      lnum = update_lnum(lnum)
    end
  end
  -- Sort them by vertical screen distance from cursor.
  local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)["row"]
  local function screen_rows_from_cur(t)
    local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])["row"]
    return math.abs(cur_screen_row - t_screen_row)
  end
  table.sort(targets, function(t1, t2)
    return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
  end)

  if #targets >= 1 then
    return targets
  end
end
