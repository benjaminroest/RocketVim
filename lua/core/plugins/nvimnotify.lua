return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Delete all Notifications",
    },
  },
  config = function()
    local nvim_notify = require "notify"

    local banned_messages = {"No information available"}

    vim.notify = function(msg, level, opts)
      for _, banned_msg in pairs(banned_messages) do
        if string.match(msg, banned_msg) then
          return
        end
      end

--      opts["stage"] = "fade"

      return nvim_notify(msg, level, opts)
    end
  end
}
