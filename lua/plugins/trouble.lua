MiniDeps.add({ source = "folke/trouble.nvim" })

local configure = function()
	require("trouble").setup()
end

MiniDeps.later(configure())
