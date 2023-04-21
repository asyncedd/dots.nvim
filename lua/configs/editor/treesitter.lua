return function()
  local status, tressitter = pcall(require, "nvim-treesitter.configs")
  if (not stauts) then return end

  treesitter.setup({
    auto_install = true, -- Auto-install missing parsers. (once you open a file that requires it.)
    highlight = {
      enable = true -- Enable beautiful syntax highlighting!!!
    }
  })
end
