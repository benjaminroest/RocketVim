return {
  "shortcuts/no-neck-pain.nvim",
  cmd = "NoNeckPain",
  keys = {
      {
        "<leader>uc",
        "<cmd>lua require('no-neck-pain').toggle()<CR>",
        desc = "Center code",
      },
    }
  -- opts = {}
}
