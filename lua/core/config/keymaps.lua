local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("i", "jk", "<Esc>")

-- Buffers
map("n", "<TAB>", ":BufferLineCycleNext<cr>")
map("n", "<S-TAB>", ":BufferLineCyclePrev<cr>")

-- Window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>")
map("n", "<A-Down>", "<cmd>resize -2<cr>")
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>")

map("i", "<C-BS>", "<Esc>cvb")
map("n", "H", "^")
map("n", "L", "$")

-- quit
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keeps the cursor on the same line while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better indendting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- Save file
map({ "v", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Moving lines up/down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")

-- Moving lines up/down for mac (option+j/k)
map("v", "∆", ':m ">+1<cr>gv=gv')
map("v", "˚", ':m "<-2<cr>gv=gv')
map("n", "∆", ":m .+1<cr>==")
map("n", "˚", ":m .-2<cr>==")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Misc
map("n", "Q", "@q")

local function smart_dd()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end

vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })
