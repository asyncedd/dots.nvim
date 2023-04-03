local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

return function()
  treesitter.setup({
    ensure_installed = { "lua", "vim", "help" },
    auto_install = true,
    highlight = {
      enable = true,
    },
  })
end
