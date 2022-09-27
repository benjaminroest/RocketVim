local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

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
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)


local function get_listed_buffers()
  local buffers = {}
  local len = 0
  for buffer = 1, vim.fn.bufnr('$') do
    if vim.fn.buflisted(buffer) == 1 then
      len = len + 1
      buffers[len] = buffer
    end
  end

  return buffers
end

vim.api.nvim_create_augroup('alpha_on_empty', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'BDeletePre',
  group = 'alpha_on_empty',
  callback = function(event)
    local found_non_empty_buffer = false
    local buffers = get_listed_buffers()

    for _, bufnr in ipairs(buffers) do
      if not found_non_empty_buffer then
        local name = vim.api.nvim_buf_get_name(bufnr)
        local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

        if bufnr ~= event.buf and name ~= '' and ft ~= 'Alpha' then
          found_non_empty_buffer = true
        end
      end
    end

    if not found_non_empty_buffer then
      vim.cmd [[:Alpha]]
    end
  end,
})
