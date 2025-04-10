return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  },
  opts = {
    quick_select = "123456789",
    icons = true,
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  keys = {
    { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
    { ";", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

    { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
  },
}
