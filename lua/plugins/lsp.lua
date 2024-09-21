local add, later = MiniDeps.add, MiniDeps.later

add({
	source = "neovim/nvim-lspconfig",
})

add({
	source = "williamboman/mason.nvim",
})

add({
	source = "williamboman/mason-lspconfig.nvim",
})

local function configure()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"vtsls",
			"eslint",
			"rust_analyzer",
			"cssls",
			"cssmodules_ls",
			"bashls",
			"prismals",
			"pyright",
			"ruff",
			"stylelint_lsp",
			"grammarly",
			"vimls",
			"yamlls",
		},
	})
	require("mason-lspconfig").setup_handlers({
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup({})
		end,
	})
end

later(configure())
