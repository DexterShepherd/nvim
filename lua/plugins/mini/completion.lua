local later = MiniDeps.later

later(require("mini.completion").setup({
	window = {
		info = { border = "rounded" },
		signature = { border = "rounded" },
	},
}))
