require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on " and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it"s label
        group = " " -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {1, 2, 1, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

-- Set leader
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {noremap = true, silent = true})
vim.g.mapleader = " "

local opts_n = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local opts_v = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Explorer
vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- Buffer pick
vim.api.nvim_set_keymap("n", "<Leader>b", ":BufferLinePick<CR>", {noremap = true, silent = true})

-- Switch between h/cpp
vim.api.nvim_set_keymap("n", "<Leader>o", ":ClangdSwitchSourceHeader<CR>", {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":Commentary<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":Commentary<CR>", {noremap = true, silent = true})

-- vim.api.nvim_set_keymap("v", "<leader>cf", ":lua vim.lsp.buf.range_formatting()<CR>", {noremap = true, silent = true})

local mappings_n = {
	["/"] = "Comment",
	["b"] = "Buffer pick",
	["e"] = "Explorer",
	f = {
		name = "Search",
		f = {"<cmd>Telescope find_files<cr>", "Find File"},
		t = {"<cmd>Telescope live_grep<cr>", "Text"},
		s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
		S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"}
	},
	c = {
		name = "Code",
		f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format"},
		a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions"},
		j = {"<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }}})<CR>", "Next Diagnostic"},
		k = {"<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }}})<CR>", "Prev Diagnostic"}
	}
}

local mappings_v = {
	["/"] = "Comment",
	c = {
		name = "Code",
		f = {"<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format"}
	}
}

local wk = require("which-key")
wk.register(mappings_n, opts_n)
wk.register(mappings_v, opts_v)
