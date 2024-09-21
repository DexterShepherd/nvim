local function config()
	require("mini.notify").setup()

	local opts = { ERROR = { duration = 10000 } }
	vim.notify = MiniNotify.make_notify(opts)
end

MiniDeps.later(config())
