local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>r"] = { name = "+replace" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
  config = function(_, opts)
    local wk = require "which-key"
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}

-- M.dsgsg = function()
--   require("which-key").setup {
--     plugins = {
--       marks = true, -- shows a list of your marks on " and `
--       registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--       -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--       -- No actual key bindings are created
--       presets = {
--         operators = false, -- adds help for operators like d, y, ...
--         motions = false, -- adds help for motions
--         text_objects = false, -- help for text objects triggered after entering an operator
--         windows = true, -- default bindings on <c-w>
--         nav = true, -- misc bindings to work with windows
--         z = true, -- bindings for folds, spelling and others prefixed with z
--         g = true, -- bindings for prefixed with g
--       },
--     },
--     icons = {
--       breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--       separator = "➜", -- symbol used between a key and it"s label
--       group = " ", -- symbol prepended to a group
--     },
--     window = {
--       border = "single", -- none, single, double, shadow
--       position = "bottom", -- bottom, top
--       margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
--       padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
--     },
--     layout = {
--       height = { min = 4, max = 25 }, -- min and max height of the columns
--       width = { min = 20, max = 50 }, -- min and max width of the columns
--       spacing = 3, -- spacing between columns
--       align = "center",
--     },
--     hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
--     show_help = true, -- show help message on the command line when the popup is visible
--   }
--
--   -- Set leader
--   vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
--
--   local opts_n = {
--     mode = "n", -- NORMAL mode
--     prefix = "<leader>",
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = false, -- use `nowait` when creating keymaps
--   }
--
--   local opts_v = {
--     mode = "v", -- VISUAL mode
--     prefix = "<leader>",
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = false, -- use `nowait` when creating keymaps
--   }
--
--   local mappings_n = {
--     ["w"] = { "<cmd>w!<CR>", "Save" },
--     ["q"] = { "<cmd>lua require('core.utils').smart_quit()<CR>", "Quit" },
--     -- ["f"] = { "<cmd>Telescope find_files<cr>", "Find File" },
--     -- ["b"] = { "<cmd>BufferLinePick<cr>", "Buffer pick" },
--     ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
--     -- ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
--     s = {
--       name = "Search",
--       f = { "<cmd>Telescope find_files<cr>", "Find File" },
--       t = { "<cmd>Telescope live_grep<cr>", "Text" },
--       T = { "<cmd>Telescope grep_string<cr>", "Current word" },
--       s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--       S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
--     },
--     c = {
--       name = "Code",
--       f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
--       a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Actions" },
--       r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
--       j = {
--         "<cmd>lua vim.diagnostic.goto_next({popup_opts = {border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }}})<CR>",
--         "Next Diagnostic",
--       },
--       k = {
--         "<cmd>lua vim.diagnostic.goto_prev({popup_opts = {border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }}})<CR>",
--         "Prev Diagnostic",
--       },
--     },
--     g = {
--       name = "Git",
--       j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
--       k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
--       l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--       p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--       r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--       R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--       s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--       u = {
--         "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--         "Undo Stage Hunk",
--       },
--       o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--       b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--       c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--       C = {
--         "<cmd>Telescope git_bcommits<cr>",
--         "Checkout commit(for current file)",
--       },
--       d = {
--         "<cmd>Gitsigns diffthis HEAD<cr>",
--         "Git Diff",
--       },
--     },
--     r = {
--       name = "Replace",
--       r = { "<CMD>SearchReplaceSingleBufferOpen<CR>", "Open" },
--       w = { "<CMD>SearchReplaceSingleBufferCWord<CR>", "Word" },
--       W = { "<CMD>SearchReplaceSingleBufferCWORD<CR>", "WORD" },
--       e = { "<CMD>SearchReplaceSingleBufferCExpr<CR>", "Expr" },
--       f = { "<CMD>SearchReplaceSingleBufferCFile<CR>", "File" },
--     },
--     S = {
--       name = "Settings",
--       n = { "<cmd>NoNeckPain<CR>", "Toggle center code" },
--     },
--   }
--
--   local mappings_v = {
--     ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment" },
--     c = {
--       name = "Code",
--       f = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format" },
--     },
--   }
--
--   local wk = require "which-key"
--   wk.register(mappings_n, opts_n)
--   wk.register(mappings_v, opts_v)
-- end
--
return M
