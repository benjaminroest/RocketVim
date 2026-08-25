require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ruff",
    "basedpyright",
  },
})

vim.keymap.set( "n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action"})
vim.keymap.set( "n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

