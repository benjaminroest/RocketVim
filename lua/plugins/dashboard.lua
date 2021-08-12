local vim = vim
local g = vim.g

vim.cmd "packadd dashboard-nvim"

g.dashboard_default_executive = "telescope"

local custom_header = {
  "",
  "",
  "",
  "",
  " .^.                                         ",
  " |o|    ___         _       _ __   ___       ",
  ".\' \'.  | _ \\___  __| |_____| |\\ \\ / (_)_ __  ",
  "|.-.|  |   / _ \\/ _| / / -_)  _\\ V /| | \'  \\ ",
  "\'   \'  |_|_\\___/\\__|_\\_\\___|\\__|\\_/ |_|_|_|_|"
}

g.dashboard_custom_header = custom_header

g.dashboard_custom_section = {
  a = {
    description = {"  Find File                  SPC f f"},
    command = "Telescope find_files"
  },
  b = {
    description = {"  Recents                    SPC f o"},
    command = "Telescope oldfiles"
  },
  c = {
    description = {"  New Buffer                 SPC g g"},
    command = "enew"
  },
  d = {
    description = {"  Edit Configuration         SPC d c"},
    command = "e ~/.config/nvim/init.lua"
  }
}

g.dashboard_custom_footer = {""}

vim.api.nvim_command('autocmd FileType dashboard set showtabline=0 laststatus=0')
vim.api.nvim_command('autocmd WinLeave <buffer> set showtabline=2 laststatus=2')
