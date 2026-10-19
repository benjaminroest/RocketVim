require("blink.cmp").setup({
  signature = { enabled = true },
  keymap = { preset = "enter" },
  completion = { documentation = { auto_show = true } },
})

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.ai").setup()
