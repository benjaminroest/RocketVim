local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
}

M.config = function()
  require("indent_blankline").setup {
    char = "▏",
    context_char = "▏",
    filetype_exclude = {
      "help",
      "terminal",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "lsp-installer",
      "alpha",
      "mason",
      "",
    },
    buftype_exclude = { "terminal" },
    space_char_blankline = " ",
    show_current_context = false,
    show_current_context_start = false,
  }
end

return M
