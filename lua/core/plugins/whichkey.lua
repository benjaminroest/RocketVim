local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
      opts_extend = { "spec" },
  opts = {
    plugins = { spelling = true },
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>r", group = "replace" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gz", group = "surround" },
      },
    },
  },
  -- config = function(_, opts)
  --   local wk = require "which-key"
  --   wk.setup(opts)
  --   wk.register(opts.defaults)
  -- end,
};

return M
