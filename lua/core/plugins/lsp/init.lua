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
end

return M
