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
      separator_style = "slope",
    },
  }
}
