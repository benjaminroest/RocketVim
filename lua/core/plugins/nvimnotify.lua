local M = {
  "rcarriga/nvim-notify",
}

M.config = function()
  local nvim_notify = require "notify"
  vim.notify = nvim_notify
end

return M
