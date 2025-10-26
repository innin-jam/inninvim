return {
  "flash.nvim",
  after = function()
    require("flash").setup({
      prompt = {
        prefix = { { " ", "FlashPromptIcon" } },
      },
    })
    vim.keymap.set({ "n", "v", "x" }, "/", function()
      require("flash").jump()
    end, { desc = "Flash" })
  end,
}
