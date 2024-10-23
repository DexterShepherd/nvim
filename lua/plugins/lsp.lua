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
			"ts_ls",
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

	local lspconfig = require("lspconfig")
	require("mason-lspconfig").setup_handlers({
		function(server_name) -- default handler (optional)
			lspconfig[server_name].setup({})
		end,
		["ts_ls"] = function()
			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end
			lspconfig["ts_ls"].setup({
				on_attach = function() end,
				commands = { OrganizeImports = { description = "Organize imports", organize_imports } },
			})
		end,
	})

	keymap = vim.keymap

	local on_attach = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		opts.desc = "Show LSP references"
		keymap.set("n", "gr", ":Pick lsp scope='references'<CR>", opts) -- show definition, references

		opts.desc = "Go to declaration"
		keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to declaration

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", ":Pick lsp scope='implementation'<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", ":Pick lsp scope='type_definition'<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = on_attach,
	})
end

later(configure())
