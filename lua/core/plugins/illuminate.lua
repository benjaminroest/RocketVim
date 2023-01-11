local M = {
  "RRethy/vim-illuminate",
  event = "BufReadPre",
}

M.config = function()
  require("illuminate").configure {

    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "TelescopePrompt",
      "alpha",
      "NvimTree",
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
  }
end

return M
