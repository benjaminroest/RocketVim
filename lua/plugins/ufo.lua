local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

ufo.setup {
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
}
