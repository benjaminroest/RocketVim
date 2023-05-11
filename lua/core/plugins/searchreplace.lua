return {
  "roobert/search-replace.nvim",
  event = "BufReadPre",
  keys = {
    { "<leader>rr", "<CMD>SearchReplaceSingleBufferOpen<CR>", desc = "Open" },
    { "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", desc = "Word" },
    { "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", desc = "WORD" },
    { "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>", desc = "Expr" },
    { "<leader>rf", "<CMD>SearchReplaceSingleBufferCFile<CR>", desc = "File" },
  },
  opts = {
    -- optionally override defaults
    default_replace_single_buffer_options = "gcI",
    default_replace_multi_buffer_options = "egcI",
  }
}
