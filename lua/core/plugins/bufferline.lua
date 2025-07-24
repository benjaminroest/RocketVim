return {
  "akinsho/bufferline.nvim",
  event = "BufAdd",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  opts = {
    options = {
      offsets = { { filetype = "neo-tree", text = "" } },
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "slant",
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.api.nvim_set_hl(0, "BufferLineFill", { fg= "#ffffff", bg = "NONE"})
    vim.api.nvim_set_hl(0, "BufferLineBackground", { fg= "#ffffff" })
    vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bold = true })
    vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { })
  end,
}
