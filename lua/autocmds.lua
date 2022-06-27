local M = {}

M.definitions = {
  {
    "FileType",
    {
      group = "_general_settings",
      pattern = { "qf", "help", "man" },
      desc = "Quit with q",
      command = "nnoremap <silent> <buffer> q :close<CR>",
    }
  },
  {
    "TextYankPost",
    {
      group = "_general_settings",
      pattern = "*",
      desc = "Highlight text on yank",
      callback = function()
        require("vim.highlight").on_yank { higroup = "Search", timeout = 200 }
      end,
    },
  },
  {
    "InsertEnter",
    {
      group = "_general_settings",
      pattern = "*",
      desc = "Center line on insert",
      command = "normal! zz",
    },
  },
  {
    "FileType",
    {
      group = "_filetype_settings",
      pattern = "markdown",
      desc = "Wrap lines in markdown",
      command = "setlocal wrap",
    },
  },
  {
    "FileType",
    {
      group = "_lsp_settings",
      pattern = { "lspinfo", "lsp-installer", "null-ls-info" },
      desc = "Quit with q",
      command = "nnoremap <silent> <buffer> q :close<CR>",
    }
  },
  { "FileType", "lspinfo,lsp-installer,null-ls-info", "nnoremap <silent> <buffer> q :close<CR>" },
}

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 && empty(bufname()) | Dashboard | endif ]]

function M.define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

M.define_autocmds(M.definitions)

return M
