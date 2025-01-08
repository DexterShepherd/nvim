local add, later = MiniDeps.add, MiniDeps.later

add({ source = "nvim-treesitter/nvim-treesitter" })
add({ source = "windwp/nvim-ts-autotag" })

local config = function()
	require("nvim-treesitter.configs").setup({
		highlight = { enabled = true },
		ensure_installed = {
			"tsx",
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

	require("nvim-ts-autotag").setup({
		opts = {
			-- Defaults
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = false, -- Auto close on trailing </
		},
	})
end

later(config())
