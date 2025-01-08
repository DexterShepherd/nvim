local add, later = MiniDeps.add, MiniDeps.later

add({
	source = "stevearc/oil.nvim",
	depends = { "echasnovski/mini.icons" },
})

later(require("oil").setup({
	view_options = { show_hidden = true },
	keymaps = {
		["<C-h>"] = false,
		["<C-l>"] = false,
	},
}))

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
