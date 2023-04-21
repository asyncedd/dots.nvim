local ui = {}

ui["catppuccin/nvim"] = {}

local lazy = {}

for repo, _ in pairs(ui) do
  lazy[#lazy+1] = {repo, lazy = true}
end

return lazy

