-- vim.g.nvim_tree_hide_dotfiles = 0 -- 0 by default, this option hides files and folders starting with a dot `.`
-- vim.g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
-- vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
-- vim.g.nvim_tree_auto_ignore_ft = "startify" --empty by default, don't auto open tree on specific filetypes.
-- vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
	git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
	folder = {default = "", open = "", empty = "", empty_open = "", symlink = "", arrow_closed = "", arrow_open = ""}
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = false,
    relativenumber = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = { 
        enable = false,
      },
    },
  },
  -- root_folder_modifier = ":t",
  -- show_icons = {
    -- git = 1,
    -- folders = 1,
    -- files = 1,
    -- folder_arrows = 1,
    -- tree_width = 30,
  -- },
}
