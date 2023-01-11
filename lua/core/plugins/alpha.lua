local M = {
  "goolord/alpha-nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
}

M.config = function()
  local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = {
    [[                                       ]],
    [[                        ██████████     ]],
    [[                      ██░░▓▓░░▓▓██     ]],
    [[                    ██░░    ▓▓▓▓██     ]],
    [[                ████░░░░██░░  ▓▓██     ]],
    [[              ██░░░░  ██░░██░░░░██     ]],
    [[    ██████████░░      ░░██░░░░██       ]],
    [[      ██▓▓██░░      ░░░░░░░░██         ]],
    [[        ██░░░░██████░░░░░░██           ]],
    [[        ██░░░░██████░░░░░░██           ]],
    [[          ████▓▓████░░░░██             ]],
    [[      ░░░░  ████  ░░░░██               ]],
    [[      ░░      ██▓▓▓▓████               ]],
    [[      ░░    ░░  ████▓▓██               ]],
    [[    ░░  ░░░░░░      ████               ]],
    [[    ░░░░              ██               ]],
    [[                                       ]],
  }
  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  local function footer()
    -- NOTE: requires the fortune-mod package to work
    -- local handle = io.popen("fortune")
    -- local fortune = handle:read("*a")
    -- handle:close()
    -- return fortune
    local num_plugins_loaded = #vim.fn.globpath(vim.fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1)

    return " Loaded " .. num_plugins_loaded .. " plugins"
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    pattern = "BDeletePost*",
    group = "alpha_on_empty",
    callback = function(event)
      local fallback_name = vim.api.nvim_buf_get_name(event.buf)
      local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
      local fallback_on_empty = fallback_name == "" and fallback_ft == ""

      if fallback_on_empty then
        vim.cmd "Alpha"
        vim.cmd(event.buf .. "bwipeout")
      end
    end,
  })
end

return M
