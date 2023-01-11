local M = {
  "j-hui/fidget.nvim",
  event = "BufReadPre",
}

M.config = function()
  require("fidget").setup {
    text = {
      spinner = "dots",
    },
  }
end

return M
