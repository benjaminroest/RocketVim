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

	-- Tab bar
	use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}

	-- Statusline
	use "hoob3rt/lualine.nvim"

	-- Explorer
	use "kyazdani42/nvim-tree.lua"
	use "airblade/vim-rooter"

	-- Misc
	use "windwp/nvim-autopairs"
	use "folke/which-key.nvim"

	-- Comments
  use {
		"tpope/vim-commentary",
		cmd = "Commentary"
	}

	-- Treesitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
	use "windwp/nvim-ts-autotag"
	use "andymass/vim-matchup"

	-- Lsp
	use "neovim/nvim-lspconfig"
	use {
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").setup()
		end,
	}
	use "kabouzeid/nvim-lspinstall"
 	use "glepnir/lspsaga.nvim"

	-- Autocompletion
	use "ms-jpq/coq_nvim"
	use "hrsh7th/vim-vsnip"

	-- Telescope
	use {
  	"nvim-telescope/telescope.nvim",
  	requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
	}

	-- Color
	use "christianchiarulli/nvcode-color-schemes.vim"

	-- Git
	use {
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" }
	}

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
