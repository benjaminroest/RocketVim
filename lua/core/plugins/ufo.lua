return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  opts = {
    close_fold_kinds = {'imports', 'comment'},
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  }
}
