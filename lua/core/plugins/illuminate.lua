return {
  "RRethy/vim-illuminate",
  event = "BufReadPre",
  opts = {
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
      "neo-tree"
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
    large_file_cutoff = nil,
    large_file_overrides = nil,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end
}
