return {
  "goolord/alpha-nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  event = "VimEnter",
  opts = function()
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

    dashboard.section.footer.opts.position = "center"
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

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

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = " loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
