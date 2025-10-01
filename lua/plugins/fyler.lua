vim.keymap.set("n", "<leader>fe", function()
  vim.cmd("Fyler")
end, { desc = "Open File Manager" })

return {
  "fyler.nvim",
  cmd = "Fyler",
  -- enabled = nixCats().general or false,
  after = function()
    require("fyler").setup({
      explorer = {
        default_explorer = true,
      },
    })
  end,
}
