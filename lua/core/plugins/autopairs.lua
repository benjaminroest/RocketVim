return {
  "windwp/nvim-autopairs",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string" }, -- it will not add pair on that treesitter node
      javascript = { "template_string" },
      java = false, -- don"t check treesitter on java
    },
  },
  config = function(_, opts)
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"

    npairs.setup(opts)

    require("nvim-treesitter.configs").setup {
      autopairs = { enable = true },
    }

    local ts_conds = require "nvim-autopairs.ts-conds"

    npairs.add_rules {
      Rule("{{", "  }", "vue"):set_end_pair_length(2):with_pair(ts_conds.is_ts_node "text"),
    }
  end,
}
