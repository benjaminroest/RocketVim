local M = {
  "kyazdani42/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
}

M.config = function()
  local nvim_tree = require "nvim-tree"
  local nvim_tree_config = require "nvim-tree.config"
  local tree_cb = nvim_tree_config.nvim_tree_callback

  nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {
      "startify",
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
    renderer = {
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            arrow_closed = "",
            arrow_open = "",
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    view = {
      width = 30,
      -- height = 30,
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
  }
end

return M
