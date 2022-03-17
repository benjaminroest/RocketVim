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
	use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}

	-- Statusline
	use "hoob3rt/lualine.nvim"

	-- Explorer
	use "kyazdani42/nvim-tree.lua"

	-- Misc
	use "windwp/nvim-autopairs"
	use "folke/which-key.nvim"

	-- Comments
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use "windwp/nvim-ts-autotag"

	-- Lsp
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer

	-- Autocompletion
  use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

 -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Telescope
	use {
  	"nvim-telescope/telescope.nvim",
  	requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
	}

	-- Color
  use 'folke/tokyonight.nvim'

	-- Git
	use {
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" }
	}

	-- Notifications
	use "rcarriga/nvim-notify"

	-- Dashboard
	use {
		"glepnir/dashboard-nvim",
		opt = true,
		cmd = {
			"Dashboard",
			"DashboardChangeColorscheme",
			"DashboardFindFile",
			"DashboardFindHistory",
			"DashboardFindWord",
			"DashboardJumpMarks",
			"DashboardNewfile"
		}
	}
	-- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
