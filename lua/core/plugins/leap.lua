local M = {
  "ggandor/leap.nvim",
  event = "BufRead",
}

M.config = function()
  require("leap").add_default_mappings(true)
end

return M
