vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

require("blink.cmp").setup({
  signature = { enabled = true },
  keymap = { preset = "enter" },
  completion = { documentation = { auto_show = true } },
})

require("mini.pairs").setup()
require("mini.surround").setup()
