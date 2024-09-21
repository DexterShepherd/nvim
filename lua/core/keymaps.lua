vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>", { desc = "enter normal mode" })

vim.keymap.set("n", ",n", "<cmd>noh<cr>", { desc = "clear search highlight" })
