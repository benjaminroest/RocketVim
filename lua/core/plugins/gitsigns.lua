return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "󰍟" },
      topdelete = { text = "󰍟" },
      changedelete = { text = "▎"},
    },
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "󰍟" },
      topdelete = { text = "󰍟" },
      changedelete = { text = "▎"},
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
    end,
  }
}
