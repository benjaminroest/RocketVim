local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "jsonls",
  "sumneko_lua",
  "pyright",
  "tailwindcss",
  "volar",
  "tsserver",
  "bashls",
  "rust_analyzer",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}

    if server_name == "jsonls" then
      local jsonls_opts = require "core.plugins.lsp.settings.jsonls"
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server_name == "sumneko_lua" then
      local sumneko_opts = require "core.plugins.lsp.settings.sumneko_lua"
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server_name == "pyright" then
      local pyright_opts = require "core.plugins.lsp.settings.pyright"
      opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server_name == "tsserver" then
      local tsserver_opts = require "core.plugins.lsp.settings.tsserver"
      opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    lspconfig[server_name].setup(opts)
  end,
}
