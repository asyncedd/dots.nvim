return function()
  local icons = require("core.utils.icons.diagnostics")

  local mason_lspconfig = require("mason-lspconfig")
  local mason = require("mason")
  local lspconfig = require("lspconfig")
  local neodev = require("neodev")
  local masonNullLs = require("mason-null-ls")
  -- local nullls = require("null-ls")

  neodev.setup()

  mason.setup()

  masonNullLs.setup({
    automatic_setup = true,
  })

  mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
    },
    automatic_installation = true,
  })

  local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
      filter = function(client)
        -- apply whatever logic you want (in this example, we'll only use null-ls)
        return client.name == "null-ls"
      end,
      bufnr = bufnr,
    })
  end

  -- formatting on save, you can use this as a callback
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  -- add to your shared on_attach callback
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    local keymap = vim.keymap.set

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
    keymap("n", "gd", vim.lsp.buf.definition, bufopts)
    keymap("n", "K", vim.lsp.buf.hover, bufopts)
    keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    keymap("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    keymap("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    keymap("n", "gr", vim.lsp.buf.references, bufopts)
    keymap("n", "<space>f", vim.lsp.buf.format, bufopts)

    -- use null-ls for formatting
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = require("plugins.configs.lsp.servers.lua_ls"),
    on_attach = on_attach,
  })

  for name, icon in pairs(icons) do
    name = "DiagnosticSign" .. name
    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  end

  vim.diagnostic.config({
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4 },
      severity_sort = true,
    },
  })

  -- nullls.setup({
  --   sources = {
  --     nullls.builtins.formatting.stylua,
  --   },
  -- })
end
