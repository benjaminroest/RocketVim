local utils = require("core.utils")

local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
  },
}

M.config = function()
  require "core.plugins.lsp.mason"
  require("core.plugins.lsp.handlers").setup()
  require "core.plugins.lsp.null-ls"

  utils.on_attach(function(client, buffer)
        require("core.plugins.lsp.keymaps").on_attach(client, buffer)
      end)
end

return M
