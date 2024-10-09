MiniDeps.add({ source = "gbprod/yanky.nvim" })

local function configure()
	require("yanky").setup({})

	local opts = { silent = true }

	opts.desc = "[yanky] Put after"
	vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", opts)

	opts.desc = "[yanky] Put before"
	vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", opts)

	opts.desc = "[yanky] Put before"
	vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", opts)

	opts.desc = "[yanky] yank ring prev"
	vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)", opts)

	opts.desc = "[yanky] yank ring next"
	vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)", opts)
end

MiniDeps.later(configure)
