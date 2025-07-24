local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    -- "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
  },
  event = "BufReadPost",
  opts = {
    ensure_installed = {},
    sync_install = false,
    ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
    auto_install = true,
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    -- context_commentstring = {
    --   enable = true,
    --   enable_autocmd = false,
    -- },
    -- playground = {
    --   enable = true,
    --   disable = {},
    --   updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --   persist_queries = false, -- Whether the query persists across vim sessions
    --   keybindings = {
    --     toggle_query_editor = "o",
    --     toggle_hl_groups = "i",
    --     toggle_injected_languages = "t",
    --     toggle_anonymous_nodes = "a",
    --     toggle_language_display = "I",
    --     focus_language = "f",
    --     unfocus_language = "F",
    --     update = "R",
    --     goto_node = "<cr>",
    --     show_help = "?",
    --   },
    -- },
  },
  config = function(_, opts)
    local configs = require "nvim-treesitter.configs"
    configs.setup(opts)
    require('nvim-treesitter.configs').setup {}
  end
}


return M
