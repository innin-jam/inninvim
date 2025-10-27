return {
  "render-markdown.nvim",
  enabled = nixCats("markdown") or false,
  cmd = { "RenderMarkdown" },
  ft = { "markdown" },
  after = function()
    require("render-markdown").setup({
      completions = {
        -- blink = { enabled = true },
        preset = "obsidian",
      }, -- I DON'T KNOW WHAT THIS DOES
    })
  end,
}
