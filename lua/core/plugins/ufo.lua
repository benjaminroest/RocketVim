return {
  "kevinhwang91/nvim-ufo",
  -- event = "VeryLazy",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  opts = {
    open_fold_hl_timeout = 400,
    close_fold_kinds_for_ft = { "imports", "comment" },
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  },
}
