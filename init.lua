local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

require "core.config.settings"
require "core.config.plugins-list"
require "core.config.keymappings"
require "core.plugins"
require "core.lsp"
require "core.config.colorscheme"
require "core.config.autocmds"
