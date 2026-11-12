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
  if MiniFiles.close() then return end

  local path = vim.api.nvim_buf_get_name(0)
  if path == "" or not vim.uv.fs_stat(path) then
    local dir = path ~= "" and vim.fs.dirname(path) or nil
    path = (dir and vim.uv.fs_stat(dir)) and dir or vim.uv.cwd()
  end

  MiniFiles.open(path, false)
end, { desc = "Toggle mini.files" })

local flash = require("flash")
flash.setup({
  modes = {
    char = {
      enabled = false
    }
  }
})
vim.keymap.set("n", ",", flash.jump, { desc = "Flash" })

