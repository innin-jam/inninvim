return {
  "render-markdown.nvim",
  enabled = nixCats("markdown") or false,
  cmd = { "RenderMarkdown" },
  -- after = function(_)
  --   require("render-markdown.nvim").setup({
  --
  --   })
  -- end
}
