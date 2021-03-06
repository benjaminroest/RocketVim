local vim = vim
local g = vim.g

vim.cmd "packadd dashboard-nvim"

g.dashboard_default_executive = "telescope"

local custom_header = {
  "",
  "",
  "",
  "                          ██████████    ",
  "                        ██░░▓▓░░▓▓██    ",
  "                      ██░░    ▓▓▓▓██    ",
  "                  ████░░░░██░░  ▓▓██    ",
  "                ██░░░░  ██░░██░░░░██    ",
  "      ██████████░░      ░░██░░░░██      ",
  "        ██▓▓██░░      ░░░░░░░░██        ",
  "          ██░░░░██████░░░░░░██          ",
  "          ██░░░░██████░░░░░░██          ",
  "            ████▓▓████░░░░██            ",
  "        ░░░░  ████  ░░░░██              ",
  "        ░░      ██▓▓▓▓████              ",
  "        ░░    ░░  ████▓▓██              ",
  "      ░░  ░░░░░░      ████              ",
  "      ░░░░              ██              ",
  "",
  "",
  "",
}

g.dashboard_custom_header = custom_header

g.dashboard_custom_section = {
  a = {
    description = { "  Find File                  " },
    command = "Telescope find_files",
  },
  b = {
    description = { "  Recents                    " },
    command = "Telescope oldfiles",
  },
  c = {
    description = { "  Git status                 " },
    command = "Telescope git_status",
  },
  d = {
    description = { "  Edit Configuration         " },
    command = "e ~/.config/nvim/init.lua",
  },
}

local num_plugins_loaded = #vim.fn.globpath(vim.fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1)

g.dashboard_custom_footer = { " Loaded " .. num_plugins_loaded .. " plugins" }

require("autocmds").define_autocmds {
  {
    "FileType",
    {
      group = "_dashboard_settings",
      pattern = "dashboard",
      command = "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
    },
  },
  {
    "FileType",
    {
      group = "_dashboard_settings",
      pattern = "dashboard",
      command = "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2",
    },
  },
  {
    "FileType",
    {
      group = "_dashboard_settings",
      pattern = "dashboard",
      desc = "Quit with q",
      command = "nnoremap <silent> <buffer> q :q<CR>",
    },
  },
}
