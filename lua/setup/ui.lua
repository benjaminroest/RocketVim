vim.cmd("colorscheme teide-darker")

vim.o.cmdheight = 0
require("vim._core.ui2").enable({ msg = { targets = "msg" } })

vim.diagnostic.config({
  float = {
    source = "always",
  }
})

local MiniIcons = require("mini.icons")
MiniIcons.setup()

local wk = require("which-key")

wk.setup({
  show_help = false,
  layout = {
    align = "center",
  },
})
wk.add({
   { "<leader>f", group = "+ Find" },
   { "<leader>c", group = "+ Code" },
   { "<leader>h", group = "+ Hunk" },
})

local signs = {
  add = { text = "▎" },
  change = { text = "▎" },
  delete = { text = "󰍟" },
  topdelete = { text = "󰍟" },
  changedelete = { text = "▎"},
}

 local gitsigns = require("gitsigns")

 gitsigns.setup({
  signs = signs,
  signs_staged = signs,
})

vim.keymap.set("n", "]h", function()
  gitsigns.nav_hunk("next")
end, { desc = "Next hunk" })
vim.keymap.set("n", "[h", function()
  gitsigns.nav_hunk("prev")
end, { desc = "Prev hunk" })
vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk"})
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk"})
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk"})
vim.keymap.set("n", "<leader>hb", function()
  gitsigns.blame_line({ full = true })
end, { desc = "Blame"})
