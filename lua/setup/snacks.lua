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
  }
})

vim.keymap.set("n", "<leader><space>", Snacks.picker.files, { desc = "Find files", })
vim.keymap.set("n", "<leader>/", Snacks.picker.grep, { desc = "Grep", })
vim.keymap.set("n", "<leader>fb", Snacks.picker.buffers, { desc = "Find buffers", })

vim.keymap.set("n", "<leader>fk", Snacks.picker.keymaps, { desc = "Find keymaps", })
vim.keymap.set("n", "<leader>fh", Snacks.picker.help, { desc = "Find help pages", })

-- LSP 
vim.keymap.set("n", "<leader>fs", Snacks.picker.lsp_symbols, { desc = "LSP Symbols" })
vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions, { desc = "Goto Definition" })
vim.keymap.set("n", "gr", Snacks.picker.lsp_references, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", Snacks.picker.lsp_implementations, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", Snacks.picker.lsp_type_definitions, { desc = "Goto T[y]pe Definition" })


