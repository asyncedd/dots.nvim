-- Wow, this would be hard!

-- First, We need to attach the LSPConfig to the current buffer ASAP.
-- I don't know why, but I think it'll be more performant. (smh)

-- I'll break this down later.
-- Im too lazy.


-- Setup LSP signature later. The chances of this being used is unlikely, since the lsp should be busy doing stuff with the lspserver.


-- vim.api.nvim_create_autocmd("BufReadPre", {
--   callback = function()
--     require("plugins.configs.lsp.lspconfig")
--   end
-- })

local lspsaga_opts = {
  ui = {
    theme = 'round',
    title = true,
    -- border type can be single,double,rounded,solid,shadow.
    border = 'rounded',
    winblend = 0,
  }
}

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function ()

    require("plugins.configs.lsp.lspconfig")
    require("lspsaga").setup(lspsaga_opts)

    require("lsp_signature").setup()

    local fidget_configuration = {
      text = {
        spinner = "dots"
      }
    }

    -- We never nest! (not really, we just did (-_-)
    require("fidget").setup(fidget_configuration)

    -- Setup trouble.nvim...
    -- Wait! I though about some fancy component!

    require("trouble").setup()

  end
})

