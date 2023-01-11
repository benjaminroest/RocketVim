local M = {
  "hoob3rt/lualine.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  event = "VeryLazy",
}

M.config = function()
  local function clock()
    return " " .. os.date "%H:%M"
  end

  require("lualine").setup {
    options = {
      theme = "tokyonight",
      icons_enabled = true,
      section_separators = { "", "" },
      component_separators = { "", "" },
      disabled_filetypes = { "alpha" },
      -- section_separators = {"", ""},
      -- component_separators = {"", ""}
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icon = "" },
      },
      lualine_c = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
      lualine_x = { "filetype" },
      lualine_y = { clock },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "nvim-tree" },
  }
end

return M
