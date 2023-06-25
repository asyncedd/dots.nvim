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
    local ok, builtin = pcall(function()
      return require(string.format("null-ls.builtins.%s.%s", m, name))
    end)
    if ok then
      if type(name) == "table" and next(name) ~= nil then
        return builtin.with(t)
      else
        return builtin
      end
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

local function setup_formatting(names)
  local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
  require("mason").setup(names)
  ensure_installed(names)

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = group,
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      local ft = vim.bo[buf].filetype
      local have_nls = package.loaded["null-ls"]
        and (#require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0)

      vim.lsp.buf.format(vim.tbl_deep_extend("force", {
        bufnr = buf,
        filter = function(clientn)
          if have_nls then
            return clientn.name == "null-ls"
          end
          return clientn.name ~= "null-ls"
        end,
      }, {}))
    end,
  })
end

local function setup_null_ls(opts)
  local sources = opts.sources
  local list_of_sources = {}

  for name, config in pairs(sources) do
    local source = get_source_by_name(name)
    if source then
      if type(config) == "table" and next(config) ~= nil then
        table.insert(list_of_sources, source.with(config))
      else
        table.insert(list_of_sources, source)
      end
    end
  end

  local names = {}
  for _, source in ipairs(list_of_sources) do
    local name = source.name:gsub("_", "-")
    table.insert(names, name)
  end

  require("null-ls").setup({
    sources = list_of_sources,
    on_attach = function(client)
      if
        client.config
        and client.config.capabilities
        and client.config.capabilities.documentFormattingProvider == false
      then
        return
      end
      if client.supports_method("textDocument/formatting") then
        setup_formatting(names)
      end
    end,
  })
end

return function(opts)
  setup_null_ls(opts)
end
