local later = MiniDeps.later

later(require("mini.starter").setup({
	autoopen = true,
	query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
}))
