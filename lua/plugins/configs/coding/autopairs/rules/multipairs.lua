local autopairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

-- https://github.com/rstacruz/vim-closer/blob/master/autoload/closer.vim
local get_closing_for_line = function(line)
  local i = -1
  local clo = ""

  while true do
    i, _ = string.find(line, "[%(%)%{%}%[%]]", i + 1)
    if i == nil then
      break
    end
    local ch = string.sub(line, i, i)
    local st = string.sub(clo, 1, 1)

    if ch == "{" then
      clo = "}" .. clo
    elseif ch == "}" then
      if st ~= "}" then
        return ""
      end
      clo = string.sub(clo, 2)
    elseif ch == "(" then
      clo = ")" .. clo
    elseif ch == ")" then
      if st ~= ")" then
        return ""
      end
      clo = string.sub(clo, 2)
    elseif ch == "[" then
      clo = "]" .. clo
    elseif ch == "]" then
      if st ~= "]" then
        return ""
      end
      clo = string.sub(clo, 2)
    end
  end

  return clo
end

autopairs.add_rule(Rule("[%(%{%[]", "")
  :use_regex(true)
  :replace_endpair(function(opts)
    return get_closing_for_line(opts.line)
  end)
  :end_wise(function(opts)
    -- Do not endwise if there is no closing
    return get_closing_for_line(opts.line) ~= ""
  end))
