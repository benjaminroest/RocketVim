local M = {}

M.load_augroups = {
  _general_settings = {
    { "FileType", "qf,help,man", "nnoremap <silent> <buffer> q :close<CR>" },
  },
  _markdown = {
    { "FileType", "markdown", "setlocal wrap" },
  },
  _general_lsp = {
    { "FileType", "lspinfo,lsp-installer,null-ls-info", "nnoremap <silent> <buffer> q :close<CR>" },
  },
}

--- Create autocommand groups based on the passed definitions
---@param definitions table contains trigger, pattern and text. The key will be used as a group name
---@param buffer boolean indicate if the augroup should be local to the buffer
function M.define_augroups(definitions, buffer)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    if buffer then
      vim.cmd [[autocmd! * <buffer>]]
    else
      vim.cmd [[autocmd!]]
    end

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

M.define_augroups(M.load_augroups)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

return M
