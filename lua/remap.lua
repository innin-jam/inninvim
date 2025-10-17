vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Center cursor after certain actions
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous Search Result" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Copy/Paste with system clipboard
vim.keymap.set(
  { "v", "x", "n" },
  "<leader>y",
  '"+y',
  { noremap = true, silent = true, desc = "Yank to clipboard" }
)
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>Y",
  '"+yy',
  { noremap = true, silent = true, desc = "Yank line to clipboard" }
)
vim.keymap.set(
  { "n", "v", "x" },
  "<leader>p",
  '"+p',
  { noremap = true, silent = true, desc = "Paste from clipboard" }
)
vim.keymap.set(
  "i",
  "<C-p>",
  "<C-r><C-p>+",
  { noremap = true, silent = true, desc = "Paste from clipboard from within insert mode" }
)
vim.keymap.set(
  "x",
  "<leader>P",
  '"_dP',
  { noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" }
)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- LSP
vim.keymap.set(
  "n",
  "<leader>rn",
  vim.lsp.buf.rename,
  { noremap = true, silent = true, desc = "Rename" }
)
vim.keymap.set(
  "n",
  "<leader>d",
  vim.lsp.buf.definition,
  { noremap = true, silent = true, desc = "Goto Definition" }
)
vim.keymap.set(
  "n",
  "<leader>D",
  vim.lsp.buf.type_definition,
  { noremap = true, silent = true, desc = "Goto Type Definition" }
)

-- See `:help K` for why this keymap
vim.keymap.set(
  "n",
  "K",
  vim.lsp.buf.hover,
  { noremap = true, silent = true, desc = "Hover Documentation" }
)
vim.keymap.set(
  "n",
  "<C-k>",
  vim.lsp.buf.signature_help,
  { noremap = true, silent = true, desc = "Signature Documentation" }
)

-- Lesser used LSP functionality
vim.keymap.set(
  "n",
  "gD",
  vim.lsp.buf.declaration,
  { noremap = true, silent = true, desc = "[G]oto [D]eclaration" }
)
