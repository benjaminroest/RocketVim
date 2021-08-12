-- Buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-x>', ':bd<CR>', { noremap = true, silent = true })

-- Window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Lsp
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions{}<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>', {noremap = true, silent = true})
-- Scroll down/up hover doc or scroll in definition preview
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>', {noremap = true, silent = true})

-- Keeps the cursor on the same line while searching
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Moving lines up/down
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-j>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<A-k>', ':m .-2<CR>==', {noremap = true, silent = true})
-- Moving lines up/down for mac (option+j/k)
vim.api.nvim_set_keymap('v', '∆', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '˚', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '∆', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '˚', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '∆', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '˚', ':m .-2<CR>==', {noremap = true, silent = true})

-- Misc
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', {noremap = true, silent = true})
