vim.opt.spell = true
vim.opt.spelllang = "en_us,nl"

--disable mouse
vim.opt.mouse = ""

-- disable built-in explorer (comment these to enable downloading of spell languages
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- set line numbers
vim.o.number = true
vim.o.relativenumber = true

-- highlight cursor line
vim.o.cursorline = true

-- seach case-insensitive if only lowercase
vim.o.ignorecase = true
vim.o.smartcase = true

-- use clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

require "components/lazy"
require "components/mason"
require "components/nvim-cmp"
require "components/formatter"
require "components/nvim-lint"
require "components/treesitter"
require "components/telescope"
require "components/nvim-tree"
require "components/which-key"
require "components/comment"
require "components/lualine"
require "components/bufferline"
require "components/gitsigns"
require "components/autopairs"
require "components/auto-dark-mode"
require "components/indent-blankline"

-- navigate splits and buffers
vim.keymap.set("n", "<leader>3", ":bp<cr>")
vim.keymap.set("n", "<leader>4", ":bn<cr>")
vim.keymap.set("n", "<leader>5", "<C-w><C-w>")

-- clear search on double escape
vim.keymap.set("n", "<leader>c", ":noh<cr>")

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Highlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
  end,
})

-- hard mode ;)
vim.keymap.set("n", "<Left>", ":echo 'NOPE'<CR>")
vim.keymap.set("n", "<Right>", ":echo 'NOPE'<CR>")
vim.keymap.set("n", "<Up>", ":echo 'NOPE'<CR>")
vim.keymap.set("n", "<Down>", ":echo 'NOPE'<CR>")
vim.keymap.set("i", "<Left>", "<Esc>")
vim.keymap.set("i", "<Right>", "<Esc>")
vim.keymap.set("i", "<Up>", "<Esc>")
vim.keymap.set("i", "<Down>", "<Esc>")
