-- Wow, this would be hard!

-- First, We need to attach the LSPConfig to the current buffer ASAP.
-- I don't know why, but I think it'll be more performant. (smh)

-- I'll break this down later.
-- Im too lazy.


-- Setup LSP signature later. The chances of this being used is unlikely, since the lsp should be busy doing stuff with the lspserver.

vim.schedule(function ()
  require("lsp_signature").setup()
end)

local fidget_configuration = {
  text = {
    spinner = "dots"
  }
}

-- We never nest! (not really, we just did (-_-)
vim.schedule(function ()
  require("fidget").setup(fidget_configuration)

-- Setup trouble.nvim...
-- Wait! I though about some fancy component!

  require("trouble").setup()

end)

-- So, LSPSaga. We don't nest B)
local lspsaga_opts = {
  ui = {
    theme = 'round',
    title = true,
    -- border type can be single,double,rounded,solid,shadow.
    border = 'rounded',
    winblend = 0,
  }
}

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function ()
    require("lspsaga").setup(lspsaga_opts)
  end
})
