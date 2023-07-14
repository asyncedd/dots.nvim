local function get_source_by_name(name)
  local cats = {
    diagnostics = {},
    formatting = {},
    code_actions = {},
    hover = {},
    completion = {},
    _test = {},
  }

  for m, t in pairs(cats) do
    local ok, builtin = pcall(require, string.format("null-ls.builtins.%s.%s", m, name))
    if ok then
      return (type(name) == "table" and next(name) ~= nil) and builtin.with(t) or builtin
    end
  end
end

local function ensure_installed(names)
  local mr = require("mason-registry")
  for _, tool in ipairs(names) do
    local ok, p = pcall(mr.get_package, tool)
    if ok and not p:is_installed() then
      p:install()
    end
  end
end

local function setup_null_ls(opts)
  local sources = opts.sources
  local list_of_sources = {}

  for i in ipairs(sources) do
    local source = sources[i]
    if source.name ~= nil then
      table.insert(list_of_sources, source)
    end
  end

  for name, config in pairs(sources) do
    local source = get_source_by_name(name)
    if source then
      table.insert(list_of_sources, (type(config) == "table" and next(config) ~= nil) and source.with(config) or source)
    end
  end

  local names = {}
  for _, source in ipairs(list_of_sources) do
    local name = source.name:gsub("_", "-")
    table.insert(names, name)
  end

  ensure_installed(names)
  require("mason").setup(names)

  local augroup = vim.api.nvim_create_augroup("NullLsFormatting", { clear = true })

  require("null-ls").setup({
    sources = list_of_sources,
    on_attach = function(client, bufnr)
      if
        client.config
        and client.config.capabilities
        and client.config.capabilities.documentFormattingProvider == false
      then
        return
      end

      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              bufnr = bufnr,
              timeout_ms = 5000,
              filter = function(clientn)
                return clientn.name == "null-ls"
              end,
            })
          end,
        })
      end

      require("plugins.configs.lsp.config").on_attach()
    end,
  })
end

return function(opts)
  setup_null_ls(opts)
end
