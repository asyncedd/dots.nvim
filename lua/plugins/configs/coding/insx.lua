-- require("insx.preset.standard").setup({ cmdline = { enabled = true } })
-- require("insx.preset.standard").setup_cmdline_mode({ cmdline = { enabled = true } })
local insx = require("insx")

local helper = require("insx.helper")

local function auto_tag()
  local search = {}
  search.Tag = {
    Open = [=[<\(\w\+\)\%(\s\+.\{-}\)\?]=],
    Close = [=[</\w\+>]=],
  }
  return {
    builtin = {
      ["html"] = {
        {
          action = function(ctx)
            local name = ctx.before():match("<(%w+)")
            local row, col = ctx.row(), ctx.col()
            ctx.move(row, col + 1)
            ctx.send(([[</%s>]]):format(name))
            ctx.move(row, col + 1)
          end,
          enabled = function(ctx)
            return helper.regex.match(ctx.before(), search.Tag.Open) ~= nil
              and helper.regex.match(ctx.after(), helper.search.Tag.Close) == nil
          end,
        },
      },
    },
  }
end

-- endwise
local endwise = require("insx.recipe.endwise")
insx.add("<CR>", endwise(endwise.builtin))
insx.add(">", endwise(auto_tag().builtin))
