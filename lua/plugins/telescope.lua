return {
  "telescope.nvim",
  after = function()
    require("telescope").setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        -- border = "single",
      },
    })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none", fg = "" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
  end,
}
