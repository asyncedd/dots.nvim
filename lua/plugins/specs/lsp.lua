return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers_to_not_setup = {},
      servers = {},
      setup = {},
    },
    event = "VeryLazy",
    config = function(_, opts)
      local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint

      if inlay_hint then
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.server_capabilities.inlayHintProvider then
              inlay_hint(bufnr, true)
            end
          end,
        })
      end

      local servers = opts.servers
      local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), {
        textDocument = {
          completion = {
            dynamicRegistration = true,
            completionItem = {
              snippetSupport = true,
              commitCharactersSupport = true,
              deprecatedSupport = true,
              preselectSupport = true,
              insertReplaceSupport = true,
              resolveSupport = {
								-- stylua: ignore
                properties = { "documentation", "detail", "additionalTextEdits", "sortText", "filterText", "insertText", "textEdit", "insertTextFormat", "insertTextMode" },
              },
              insertTextModeSupport = {
								-- stylua: ignore
                valueSet = { 1, 2 },
              },
              labelDetailsSupport = true,
            },
            contextSupport = true,
            insertTextMode = 1,
            completionList = {
							-- stylua: ignore
              itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" },
            },
          },
        },
      }, opts.capabilities or {})

      local setup = function(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        if opts.servers[server] then
          require("lspconfig")[server].setup(server_opts)
        end
      end

      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mlsp_servers = {}
      if have_mason then
        all_mlsp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end

      vim.cmd("silent! do FileType")
      vim.api.nvim_create_autocmd("WinEnter", {
        callback = function()
          vim.cmd("silent! do FileType")
        end,
      })
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          {
            "williamboman/mason.nvim",
            opts = true,
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {},
    init = function()
      vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    config = function()
      local g = vim.g

      g.code_action_menu_window_border = "solid"
      g.code_action_menu_show_details = true
      g.code_action_menu_show_diff = true
      g.code_action_menu_show_action_kind = false
    end,
    keys = {
      { "<leader>ca", "<cmd>CodeActionMenu<CR>", desc = "Open the code action menu", mode = { "x", "n" } },
    },
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      priority = 40,
      autocmd = {
        enabled = true,
      },
    },
    event = "LspAttach",
  },
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {},
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
