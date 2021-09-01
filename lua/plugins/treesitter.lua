require"nvim-treesitter.configs".setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
    },
    highlight = {
        enable = true -- false will disable the whole extension
    },
    context_commentstring = {
        enable = true,
        config = {
          css = "// %s"
        }
      },
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
}
