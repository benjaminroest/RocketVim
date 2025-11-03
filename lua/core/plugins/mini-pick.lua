function LiveGrepCurrentWord()
  local current_word = vim.fn.expand("<cword>")
  local pick = require("mini.pick")
  pick.builtin.grep_live()
  pick.set_picker_query({current_word})
end

return {
  'nvim-mini/mini.pick',
  version = false,
  lazy = false,
  keys = {
    {
      "<leader><space>", -- try it if you didn't it is a banger keybinding for a picker
      function() require("mini.pick").builtin.files() end,
      desc = 'Find files',
    },
    { "<leader>/", function() require("mini.pick").builtin.grep_live() end, desc = "Grep" },
    { "<leader>sw", function() LiveGrepCurrentWord() end, desc = "Grep" },
  }
}
