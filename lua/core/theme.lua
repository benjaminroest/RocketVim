local M = {}

M.init = function()
  local isExistEverblush, everblush = pcall(require, "everblush")
  if isExistEverblush then
    local colors = require("everblush.core").get_colors()

    everblush.setup {
      nvim_tree = { contrast = true },
      override = {
        CursorLineNr = { fg = colors.foreground },
        IndentBlanklineChar = { fg = colors.color0 },

        -- Telescope
        TelescopeNormal = { bg = colors.contrast },
        TelescopeBorder = { bg = colors.contrast, fg = colors.contrast },
        TelescopePromptNormal = { bg = colors.cursorline },
        TelescopePromptBorder = { bg = colors.cursorline, fg = colors.cursorline },
        TelescopePromptTitle = { bg = colors.color4, fg = colors.background },
        TelescopePromptPrefix = { fg = colors.color4 },
        TelescopePromptCounter = { fg = colors.color4 },
        TelescopeSelection = { bg = colors.cursorline, fg = colors.foreground },
        TelescopeMatching = { bg = colors.cursorline, fg = colors.color4 },

        StatusLineNC = { bg = "#141b1f", fg = "#141b1f" },
      },
    }
  end
end

return M
