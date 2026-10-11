local Snacks = require("snacks")

vim.g.snacks_animate = false

Snacks.setup({
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true, },
  indent = { enabled = true },
  zenmode = { enabled = true },
  notifier = { enabled = true },
  picker = {
    layout = "custom",
    layouts = {
      custom = {
        layout = {
          box = "vertical",
          backdrop = false,
          row = -1,
          width = 0,
          height = 0.4,
          border = "none",
          title = " {title} {live} {flags}",
          title_pos = "left",
          {
            box = "horizontal",
            { win = "list", border = "rounded" },
            { win = "preview", title = "{preview}", width = 0.6, border = "rounded" },
          },
          { win = "input", height = 1, border = "bottom" },
        },
      },
    },
    win = {
      input = {
        keys = {
          ["<Esc>"] = { "close", mode = { "n", "i" } },
        },
      },
    },
  },
  zen = {
    enabled = true,
    win = {
      backdrop = {
        transparent = false
      }
    }
  }
})

vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end, { desc = "Find files", })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep", })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find buffers", })

vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Find keymaps", })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Find help pages", })

-- LSP 
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })

vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle [z]en mode" })
