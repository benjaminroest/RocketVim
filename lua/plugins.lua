---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({
  gh("folke/snacks.nvim"),

  --- Navigation
  gh("echasnovski/mini.files"),
  gh("folke/flash.nvim"),

  --- UI
  gh("serhez/teide.nvim"),
  gh("echasnovski/mini.icons"),
  gh("folke/which-key.nvim"),
  gh("lewis6991/gitsigns.nvim"),

  --- Coding
  gh("nvim-treesitter/nvim-treesitter"),
  { src = gh("saghen/blink.cmp"), version = "v1", },
  gh("nvim-mini/mini.pairs"),
  gh("nvim-mini/mini.surround"),

  --- LSP
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  gh("neovim/nvim-lspconfig"),
})
