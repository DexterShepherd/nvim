MiniDeps.add({
	source = "amitds1997/remote-nvim.nvim",
})

MiniDeps.add({ source = "nvim-lua/plenary.nvim" })
MiniDeps.add({ source = "MunifTanjim/nui.nvim" })
MiniDeps.add({ source = "nvim-telescope/telescope.nvim" })

local configure = function()
	require("remote-nvim").setup({})
end

MiniDeps.later(configure())
