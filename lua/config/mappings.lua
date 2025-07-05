local set = vim.keymap.set

set("i", "jk", "<Esc>", { desc = "enter normal mode" })
set("n", ",n", "<cmd>noh<cr>", { desc = "clear search highlight" })

set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- use oil instead of netw
set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
