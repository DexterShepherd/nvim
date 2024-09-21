local add, later = MiniDeps.add, MiniDeps.later

add({ source = "stevearc/conform.nvim" })

later(require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff" },
		rust = { "rustfmt" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		css = { "prettierd" },
		markdown = { "prettierd" },
	},

	format_on_save = {
		lsp_format = "fallback",
		async = false,
		timeout_ms = 500,
	},
}))
