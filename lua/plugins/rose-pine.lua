MiniDeps.add({ source = "rose-pine/neovim" })

local configure = function()
	require("rose-pine").setup({})
end

MiniDeps.later(configure())
