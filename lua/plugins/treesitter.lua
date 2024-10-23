local add, later = MiniDeps.add, MiniDeps.later

add({ source = "nvim-treesitter/nvim-treesitter" })

local config = function()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		highlight = { enabled = true },
		ensure_installed = {
			"typescript",
			"javascript",
			"json",
			"css",
			"scss",
			"lua",
			"diff",
			"editorconfig",
			"gitcommit",
			"html",
			"markdown",
			"markdown_inline",
			"prisma",
			"python",
			"rust",
			"sql",
			"styled",
			"tmux",
			"vim",
			"yaml",
		},
	})
end

later(config)
