local MiniFiles = require("mini.files")
MiniFiles.setup({
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    mappings = {
      go_in_plus  = '<CR>',
    },
})

vim.keymap.set("n", "-", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
end)

local flash = require("flash")
flash.setup({
  modes = {
    char = {
      enabled = false
    }
  }
})
vim.keymap.set("n", ",", flash.jump, { desc = "Flash" })

