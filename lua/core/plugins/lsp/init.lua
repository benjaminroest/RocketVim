local utils = require("core.utils")

local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim", -- loading as dependency ensures it's loaded before lua_ls
  },
}

M.config = function()
  require "core.plugins.lsp.mason"
  require("core.plugins.lsp.handlers").setup()

  utils.on_attach(function(client, buffer)
        require("core.plugins.lsp.keymaps").on_attach(client, buffer)
      end)
end

return M
