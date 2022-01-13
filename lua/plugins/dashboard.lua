local vim = vim
local g = vim.g

vim.cmd "packadd dashboard-nvim"

g.dashboard_default_executive = "telescope"

local custom_header = {
"",
"",
"",
"       /\\                                                                 ",
"     .'  '.                                                                ",
"    /======\\                                                              ",
"   ;:.  _   ;     _____            _        ___      ___                   ",
"   |:. (_)  |    |  __ \\          | |      | \\ \\    / (_)               ",
"   |:.  _   |    | |__) |___   ___| | _____| |\\ \\  / / _ _ __ ___        ",
"   |:. (_)  |    |  _  // _ \\ / __| |/ / _ | __\\ \\/ / | | '_ ` _ \\     ",
"   ;:.      ;    | | \\ | (_) | (__|   |  __| |_ \\  /  | | | | | | |      ",
" .' \\:.    / `.  |_|  \\_\\___/ \\___|_|\\_\\___|\\__| \\/   |_|_| |_| |_|",
"/ .-'':._.'`-. \\                                                          ",
"|/    /||\\    \\|                                                         ",
"",
"",
"",
}

g.dashboard_custom_header = custom_header

g.dashboard_custom_section = {
  a = {
    description = {"  Find File                  "},
    command = "Telescope find_files"
  },
  b = {
    description = {"  Recents                    "},
    command = "Telescope oldfiles"
  },
  d = {
    description = {"  Edit Configuration         "},
    command = "e ~/.config/nvim/init.lua"
  }
}

g.dashboard_custom_footer = {""}

vim.api.nvim_command("autocmd FileType dashboard set showtabline=0 laststatus=0")
vim.api.nvim_command("autocmd WinLeave <buffer> set showtabline=2 laststatus=2")
