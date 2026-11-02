vim.lsp.enable({
	"lua_ls",
	"nixd",
	"rust_analyzer",
  "basedpyright"
})

vim.keymap.set( "n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action"})
vim.keymap.set( "n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

