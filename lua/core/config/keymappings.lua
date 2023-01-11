local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffers
keymap("n", "<TAB>", ":BufferLineCycleNext<cr>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<cr>", opts)
keymap("n", "<S-x>", "<cmd>Bdelete<cr>", opts)

-- Window movement
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Lsp
keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<cr>", opts)
keymap("n", "gi", "<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Keeps the cursor on the same line while searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Moving lines up/down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("n", "<A-j>", ":m .+1<cr>==", opts)
keymap("n", "<A-k>", ":m .-2<cr>==", opts)

-- Moving lines up/down for mac (option+j/k)
keymap("v", "∆", ':m ">+1<cr>gv=gv', opts)
keymap("v", "˚", ':m "<-2<cr>gv=gv', opts)
keymap("n", "∆", ":m .+1<cr>==", opts)
keymap("n", "˚", ":m .-2<cr>==", opts)

-- Misc
keymap("n", "<cr>", ":noh<cr><cr>", opts)

local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })
