local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- Faster Startup
  use "lewis6991/impatient.nvim"

  -- Tab bar
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- Statusline
  use "hoob3rt/lualine.nvim"

  -- Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Misc
  use "j-hui/fidget.nvim"
  use "windwp/nvim-autopairs"
  use "folke/which-key.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "andymass/vim-matchup"
  use "abecodes/tabout.nvim"
  use "Pocco81/true-zen.nvim"
  use "gbprod/cutlass.nvim"
  use "RRethy/vim-illuminate"
  use "ggandor/leap.nvim"

  -- Comments
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"

  -- Lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Autocompletion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-nvim-lsp-signature-help" -- function arguments completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  }

  -- Color
  use "navarasu/onedark.nvim"

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- Notifications
  use "rcarriga/nvim-notify"

  -- Delete buffers
  use "famiu/bufdelete.nvim"

  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Add support for .editorconfig
  use "gpanders/editorconfig.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
