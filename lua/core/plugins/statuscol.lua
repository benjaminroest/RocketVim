return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      -- configuration goes here, for example:
      -- relculright = true,
      -- segments = {
      --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      --   {
      --     sign = { name = { "Diagnostic" }, maxwidth = 1, auto = false },
      --     click = "v:lua.ScSa"
      --   },
      --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
      --   {
      --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
      --     click = "v:lua.ScSa"
      --   },
      -- }
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1, auto = false },
          click = "v:lua.ScSa"
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
        {
          sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = false, wrap = true },
          click = "v:lua.ScSa"
        },
      }
    })
  end,
}
