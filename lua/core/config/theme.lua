local M = {}

M.init = function()
  -- local status_ok_1, _ = pcall(require, "monokai-pro.nvim")
  -- if not status_ok_1 then
  --   return
  -- end
  -- Example config in Lua
  vim.g.monokaipro_filter = "spectrum"
  vim.g.monokaipro_italic_functions = true
  vim.g.monokaipro_sidebars = { "vista_kind", "packer" }
  vim.g.monokaipro_flat_term = true

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.monokaipro_colors = { hint = "orange", error = "#ff0000" }

  -- Load the colorscheme
  vim.cmd [[colorscheme monokaipro]]
end

return M
