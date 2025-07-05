-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "enter normal mode" })

vim.keymap.set("n", ",n", "<cmd>noh<cr>", { desc = "clear search highlight" })

vim.keymap.set("n", "<leader>dn", ":OpenDailyNote<cr>", { desc = "Open daily note" })

vim.keymap.set("n", "<leadef>b", ":b#<cr>", { desc = "Prev buffer" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>sf", "<CMD>FzfLua files<CR>", { desc = "[s]earch [f]iles" })

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<Cr>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<Cr>", {})

-- vim.keymap.set("n", "<leader>sm", "<cmd>ShowReferencingFiles<cr>", { desc = "Show markdown references" })
