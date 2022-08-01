local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

require "settings"
require "plugins-list"
require "keymappings"

-- Plugins
require "plugins.nvimnotify"
require "plugins.nvimtree"
require "plugins.bufferline"
require "plugins.lualine"
require "plugins.indentblankline"
require "plugins.alpha"
require "plugins.treesitter"
require "plugins.cmp"
require "plugins.autopairs"
require "plugins.gitsigns"
require "plugins.telescope"
require "plugins.comment"
require "plugins.whichkey"
require "plugins.tabout"
require "plugins.ufo"

require "lsp"
require "colorscheme"
require "autocmds"
