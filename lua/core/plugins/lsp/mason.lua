local utils = require "core.utils"
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

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
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local configs = utils.get_lsp_configs()

require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    local opts = {}

    if utils.table_contains(configs, server_name) then
      local config_table = require(string.format("core.plugins.lsp.settings.%s", server_name))
      opts = vim.tbl_deep_extend("force", config_table, opts)
    end
    require("lspconfig")[server_name].setup(opts)
  end,
}
