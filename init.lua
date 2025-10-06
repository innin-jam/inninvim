require("remap")

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Indent
-- vim.opt.cpoptions:append('I')
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 8
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- Wrapped lines retain indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Remove numbers from signcolumn
vim.wo.signcolumn = "yes"
vim.wo.relativenumber = false
vim.wo.number = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

vim.o.updatetime = 1000
vim.o.timeoutlen = 300

vim.o.completeopt = "menu,preview,noselect"

vim.o.termguicolors = true

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Colorscheme
vim.cmd.colorscheme("rose-pine-moon")

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

autocmd("FileType", {
  desc = "remove formatoptions",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

require("plugins")
