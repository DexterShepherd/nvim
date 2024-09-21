local add, later = MiniDeps.add, MiniDeps.later

add({ source = "alexghergh/nvim-tmux-navigation" })

function config()
	local tmux = require("nvim-tmux-navigation")
	vim.keymap.set("n", "<C-h>", tmux.NvimTmuxNavigateLeft)
	vim.keymap.set("n", "<C-j>", tmux.NvimTmuxNavigateDown)
	vim.keymap.set("n", "<C-k>", tmux.NvimTmuxNavigateUp)
	vim.keymap.set("n", "<C-l>", tmux.NvimTmuxNavigateRight)
end

later(config())
