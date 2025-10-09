return {
  "nvim-lint",
  event = "FileType",
  after = function(_)
    require("lint").linters_by_ft = {
      -- -- markdown = {'vale',},
      -- kotlin = { "ktlint" },
      -- cpp = { "cpplint" },
      -- javascript = { "eslint" },
      -- typescript = { "eslint" },
      -- -- elixir = { 'credo' },
      -- go = { "golangcilint" },
      lua = { "selene" },
      rust = { "clippy" },
    }
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
