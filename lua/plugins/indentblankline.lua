local status_ok, indentblankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indentblankline.setup {
  char = "▏",
  filetype_exclude = {
    "help",
    "terminal",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "lsp-installer",
    "dashboard",
    "",
  },
  buftype_exclude = { "terminal" },
  space_char_blankline = " ",
  show_current_context = false,
  show_current_context_start = false,
}
