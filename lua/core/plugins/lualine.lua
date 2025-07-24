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

  -- Get the current buffer's filetype.
  local function get_current_filetype()
    return vim.api.nvim_buf_get_option(0, "filetype")
  end

  local function get_native_lsp()
    local buf_ft = get_current_filetype()
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
      return "None"
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return "None"
  end

  -- Get the current buffer's type.
  local function get_current_buftype()
    return vim.api.nvim_buf_get_option(0, "buftype")
  end

  -- Get the buffer's filename.
  local function get_current_filename()
    local bufname = vim.api.nvim_buf_get_name(0)
    return bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or ""
  end

  Icon_hl_cache = {}
  local lualine_require = require "lualine_require"
  local modules = lualine_require.lazy_require {
    highlight = "lualine.highlight",
    utils = "lualine.utils.utils",
  }

  -- Return the current buffer's filetype icon with highlighting.
  function M:get_current_filetype_icon()
    -- Get setup.
    local icon, icon_highlight_group
    local _, devicons = pcall(require, "nvim-web-devicons")
    local f_name, f_extension = vim.fn.expand "%:t", vim.fn.expand "%:e"
    f_extension = f_extension ~= "" and f_extension or vim.bo.filetype
    icon, icon_highlight_group = devicons.get_icon(f_name, f_extension)

    -- Fallback settings.
    if icon == nil and icon_highlight_group == nil then
      icon = ""
      icon_highlight_group = "DevIconDefault"
    end

    -- Set colors.
    local highlight_color = modules.utils.extract_highlight_colors(icon_highlight_group, "fg")
    if highlight_color then
      local default_highlight = self:get_default_hl()
      local icon_highlight = Icon_hl_cache[highlight_color]
      if not icon_highlight or not modules.highlight.highlight_exists(icon_highlight.name .. "_normal") then
        icon_highlight = self:create_hl({ fg = highlight_color }, icon_highlight_group)
        Icon_hl_cache[highlight_color] = icon_highlight
      end
      icon = self:format_hl(icon_highlight) .. icon .. default_highlight
    end

    -- Return the formatted string.
    return icon
  end

  -- Return the current buffer's filename with the filetype icon.
  function M:get_current_filename_with_icon()
    -- Get icon and filename.
    local icon = M.get_current_filetype_icon(self)
    local f_name = get_current_filename()

    -- Add readonly icon.
    local readonly = vim.api.nvim_buf_get_option(0, "readonly")
    local modifiable = vim.api.nvim_buf_get_option(0, "modifiable")
    local nofile = get_current_buftype() == "nofile"
    if readonly or nofile or not modifiable then
      f_name = f_name .. " "
    end

    -- Return the formatted string.
    return icon .. " " .. f_name
  end

  local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

  require("lualine").setup {
    options = {
      theme = "kanagawa",
      icons_enabled = true,
      component_separators = { "", "" },
      disabled_filetypes = { "alpha" },
      section_separators = { "", "" },
      -- component_separators = {"", ""}
    },
    sections = {
      lualine_a = {
        {
          "mode",
          icon = { "" },
          separator = { left = "", right = "" },
        },
      },
      lualine_b = {
        {
          M.get_current_filename_with_icon,
          separator = { right = "" },
        },
      },
      lualine_c = {
        { "branch", icon = "" },
      },
      lualine_x = {
        {
          function()
            local icon = require("lazyvim.config").icons.kinds.Copilot
            local status = require("copilot.api").status.data
            return icon .. (status.message or "gdggree")
          end,
          cond = function()
            local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
            return ok and #clients > 0
          end,
              color = fg("Constant") ,
        },
            -- {
            -- stylua: ignore
            --   function() return require("noice").api.status.command.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --   color = fg("Statement")
            -- },
            -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.mode.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            --   color = fg("Constant") ,
            -- },
        { "diagnostics", sources = { "nvim_lsp" } },
      },
      lualine_y = {
        {
          get_native_lsp,
          icon = {
            "",
            align = "left",
          },
          separator = { left = "" },
        },
      },
      lualine_z = {
        {
          "progress",
          icon = {
            "",
            align = "left",
          },
          separator = { left = "" },
        },
      },
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
