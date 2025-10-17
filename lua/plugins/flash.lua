return {
  "flash.nvim",
  after = function()
    require("flash").setup({
      prompt = {
        prefix = { { "", "FlashPromptIcon" } },
      },
    })
    vim.keymap.set("n", "/", function()
      require("flash").jump()
    end, { desc = "Flash" })
  end,
}
