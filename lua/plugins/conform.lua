local add, later = MiniDeps.add, MiniDeps.later

add({ source = "stevearc/conform.nvim" })

later(require("conform").setup({
	formatters = {
		chuckformat = {
			command = "chuck-format",
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff" },
		rust = { "rustfmt" },
		javascript = { "prettier", "eslint" },
		typescript = { "prettier", "eslint" },
		javascriptreact = { "prettier", "eslint" },
		typescriptreact = { "prettier", "eslint" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		css = { "prettier" },
		markdown = { "prettier" },
		chuck = { "chuckformat" },
	},

	format_on_save = {
		lsp_format = "fallback",
		async = false,
		timeout_ms = 500,
	},
}))
