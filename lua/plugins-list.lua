return require("packer").startup({function()
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

end,

-- Use popup window
config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end
  }
}})
