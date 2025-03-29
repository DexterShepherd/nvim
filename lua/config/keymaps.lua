-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "enter normal mode" })

vim.keymap.set("n", ",n", "<cmd>noh<cr>", { desc = "clear search highlight" })

vim.keymap.set("n", "<leader>dn", ":OpenDailyNote<cr>", { desc = "Open daily note" })

vim.keymap.set("n", "<leadef>b", ":b#<cr>", { desc = "Prev buffer" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
