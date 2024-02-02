return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    vim.keymap.set("n", "<leader>gp", ":lua require('gitsigns').preview_hunk()<CR>")
    vim.keymap.set("n", "<leader>gt", ":lua require('gitsigns').toggle_current_line_blame()<CR>")
  end,
}

