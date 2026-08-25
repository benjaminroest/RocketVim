vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({ "v", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set({ "v", "n", "s" }, "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- Misc
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps the cursor on the same line while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace
vim.keymap.set("n", "<leader>r", function()
  local w = vim.fn.expand("<cword>")
  vim.fn.feedkeys(
    (":%%s/\\<%s\\>/%s/gI"):format(w, w) .. vim.keycode("<Left><Left><Left>")
  )
end, { desc = "Replace word" })

vim.keymap.set("x", "<leader>r", function()
  vim.cmd.normal({ '"zy', bang = true })
  local s = vim.fn.getreg("z")
  vim.fn.feedkeys(
    (":%%s/\\V%s/%s/gI"):format(vim.fn.escape(s, [[\/]]), s) .. vim.keycode("<Left><Left><Left>")
  )
end, { desc = "Replace selection" })


--- LSP
vim.keymap.set(
  "n",
  "D",
  function() vim.diagnostic.open_float({ border = "solid" }) end,
  { desc = "[v]iew [d]iagnostic float" }
)

vim.keymap.set( "n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, { desc = "Next Diagnostic" })

vim.keymap.set( "n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = "Prev Diagnostic"})
