local theme = require "theme"

vim.o.mouse = "a" -- Enable your mouse
vim.o.incsearch = true --Show search matches while typing
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.pumheight = 12 -- Set the height of the popup window
vim.o.updatetime = 300 -- faster completion
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 2 -- the number of spaces inserted for each identation
vim.o.tabstop = 2 -- insert two spaces for a tab
vim.o.laststatus = 3 -- global statusbar

vim.wo.relativenumber = true -- Set relative numbers
vim.wo.number = true -- Set lines numbered
vim.wo.scrolloff = 8 -- Set scroll offset
vim.wo.wrap = false -- Display long lines as one line
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"
vim.wo.cursorline = true

theme.init()

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
