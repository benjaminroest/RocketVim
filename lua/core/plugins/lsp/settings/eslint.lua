return {
  on_attach = function()
    local opts = {
        noremap = true,
        silent = true
    }
    vim.api.nvim_set_keymap('n', '<leader>cf', ':EslintFixAll<CR>', opts)
  end
}
