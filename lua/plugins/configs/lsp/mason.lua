require("mason").setup()

local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette

local error = colors.red
local warning = colors.yellow
local info = colors.sky
local hint = colors.teal
require("catppuccin.lib.highlighter").syntax({
  ["@lsp.type.parmeter"] = { fg = colors.red },
  ["@lsp.type.function"] = { fg = colors.blue },

  LspDiagnosticsUnderlineError = { style = { "undercurl" }, sp = error }, -- Used to underline "Error" diagnostics
  LspDiagnosticsUnderlineWarning = { style = { "undercurl" }, sp = warning }, -- Used to underline "Warning" diagnostics
  LspDiagnosticsUnderlineInformation = { style = { "undercurl" }, sp = info }, -- Used to underline "Information" diagnostics
  LspDiagnosticsUnderlineHint = { style = { "undercurl" }, sp = hint }, -- Used to underline "Hint" diagnostics
})

require("core.utils.highlight." .. vim.g.colorscheme .. ".semantic_tokens")

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local mlsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mlsp.setup({
  ensure_installed = {
    "lua_ls",
  },

  automatic_installtion = true,
})

require("core.utils.installPkg")({
  "stylua",
  -- "luacheck",
})

mlsp.setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      settings = require("lsp.servers.lua_ls"),
    })
  end,
})
