MiniDeps.add({ source = "github/copilot.vim" })

local configure = function()
	vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next copilot suggestion" })
	vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Prev copilot suggestion" })
end

MiniDeps.later(configure())
