local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

require "core.settings"
require "core.plugins-list"
require "core.keymappings"
require "core.plugins"
require "core.lsp"
require "core.colorscheme"
require "core.autocmds"
