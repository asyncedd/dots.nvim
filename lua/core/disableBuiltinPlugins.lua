-- disable builtins plugins
local builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "netrw",
  "netrwFileHandlers",
  "loaded_remote_plugins",
  "loaded_tutor_mode_plugin",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "matchparen", -- matchparen.nvim disables the default
}

for _, plugin in pairs(builtins) do
  vim.g[plugin] = 1
end

vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0
