return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "tokyonight-moon"
  end
}
-- return {
--     'AlexvZyl/nordic.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require 'nordic' .load()
--     end
-- }
-- return {
--   "loctvl842/monokai-pro.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("monokai-pro").setup()
--     vim.cmd.colorscheme "monokai-pro"
--   end
-- }


-- TelescopeNormal = { bg = colors.contrast },
-- TelescopeBorder = { bg = colors.contrast, fg = colors.contrast },
-- TelescopePromptNormal = { bg = colors.cursorline },
-- TelescopePromptBorder = { bg = colors.cursorline, fg = colors.cursorline },
-- TelescopePromptTitle = { bg = colors.color4, fg = colors.background },
-- TelescopePromptPrefix = { fg = colors.color4 },
-- TelescopePromptCounter = { fg = colors.color4 },
-- TelescopeSelection = { bg = colors.cursorline, fg = colors.foreground },
-- TelescopeMatching = { bg = colors.cursorline, fg = colors.color4 },
-- StatusLineNC = { bg = "#141b1f", fg = "#141b1f" },
