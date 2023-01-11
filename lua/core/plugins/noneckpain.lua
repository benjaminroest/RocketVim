local M = {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  cmd = { "NoNeckPain" },
}

M.config = function()
  require("no-neck-pain").setup {
    width = 130,
  }
end

return M
