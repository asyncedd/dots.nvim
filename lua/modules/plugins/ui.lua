local ui = {}

ui["catppuccin/nvim"] = {
  lazy = true,
}

local lazy = {}

for repo, config in pairs(ui) do
  table.insert(lazy, vim.tbl_extend("force", { repo }, config))
end

return lazy
