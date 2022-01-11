local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffers
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-x>", ":bd<CR>", { noremap = true, silent = true })

-- Window movement
keymap("n", "<C-h>", "<C-w>h", {silent = true})
keymap("n", "<C-j>", "<C-w>j", {silent = true})
keymap("n", "<C-k>", "<C-w>k", {silent = true})
keymap("n", "<C-l>", "<C-w>l", {silent = true})

-- Lsp
keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
keymap("n", "gi", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
keymap("n", "ca", ":Lspsaga code_action<CR>", opts)
keymap("n", "K", ":Lspsaga hover_doc<CR>", opts)
keymap("n", "<C-p>", ":Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "<C-n>", ":Lspsaga diagnostic_jump_next<CR>", opts)
-- Scroll down/up hover doc or scroll in definition preview
keymap("n", "<C-f>", "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", opts)
keymap("n", "<C-b>", "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", opts)

-- Keeps the cursor on the same line while searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Moving lines up/down
keymap("v", "<A-j>", ":m \">+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m \"<-2<CR>gv=gv", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("i", "<A-j>", ":m .+1<CR>==", opts)
keymap("i", "<A-k>", ":m .-2<CR>==", opts)
-- Moving lines up/down for mac (option+j/k)
keymap("v", "∆", ":m \">+1<CR>gv=gv", opts)
keymap("v", "˚", ":m \"<-2<CR>gv=gv", opts)
keymap("n", "∆", ":m .+1<CR>==", opts)
keymap("n", "˚", ":m .-2<CR>==", opts)
keymap("i", "∆", ":m .+1<CR>==", opts)
keymap("i", "˚", ":m .-2<CR>==", opts)

-- Misc
keymap("n", "<CR>", ":noh<CR><CR>", opts)
