vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep" })

return {
  "fzf-lua",
  cmd = "FzfLua",
  after = function()
    require("fzf-lua").setup({ fzf_colors = true })
  end,
}
