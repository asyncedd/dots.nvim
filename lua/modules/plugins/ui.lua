local ui = {}

ui["catppuccin/nvim"] = {
  lazy = true,
}

local lazy = {}

for repo, _ in pairs(ui) do
  lazy[#lazy+1] = {repo, lazy=true}
end

return lazy
