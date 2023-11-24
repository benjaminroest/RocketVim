-- return {
--   "Everblush/nvim",
--   name = "everblush",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "everblush"
--   end
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
  end,
}
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "tokyonight-moon"
--   end
-- }
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
