local set = vim.keymap.set

set("i", "jk", "<Esc>", { desc = "enter normal mode" })
set("n", ",n", "<cmd>noh<cr>", { desc = "clear search highlight" })


-- use oil instead of netw
set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

