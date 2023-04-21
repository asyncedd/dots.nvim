local yop = require("yop")

yop.op_map({ "n", "v" }, "<leader>gs", function(lines)
  -- Multiple lines can't be searched for
  if #lines > 1 then
    return
  end
  require("telescope.builtin").grep_string({ search = lines[1] })
end)
