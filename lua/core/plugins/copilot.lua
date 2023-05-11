return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<A-CR>",
        accept_line = "<C-PageUp>",
        accept_word = "<C-PageDown>",
        prev = "<PageUp>",
        next = "<PageDown>",
        dismiss = "<M-c>",
      },
    },
  },
}
