return {
  "telescope.nvim",
  after = function()
    require("telescope").setup({})
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
  end,
}
