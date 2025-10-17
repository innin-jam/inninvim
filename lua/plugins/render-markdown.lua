return {
  "render-markdown.nvim",
  enabled = nixCats("markdown") or false,
  cmd = { "RenderMarkdown" },
  ft = { "markdown" },
  after = function()
    require("render-markdown").setup({
      completions = { lsp = { enabled = true } }, -- I DON'T KNOW WHAT THIS DOES
    })
  end,
}
