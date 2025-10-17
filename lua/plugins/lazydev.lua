return {
  -- lazydev makes your lsp way better in your config without needing extra lsp configuration.
  "lazydev.nvim",
  enabled = nixCats("lua") or false,
  cmd = { "LazyDev" },
  ft = "lua",
  after = function()
    require("lazydev").setup({
      library = {
        { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. "/lua" },
      },
    })
  end,
}
