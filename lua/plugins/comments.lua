MiniDeps.add({ source = "JoosepAlviste/nvim-ts-context-commentstring" })

local configure = function()
	require("ts_context_commentstring").setup({
		enable_autocmd = false,
	})
	local get_option = vim.filetype.get_option
	vim.filetype.get_option = function(filetype, option)
		print("GET OPTION")
		return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
			or get_option(filetype, option)
	end
end

MiniDeps.later(configure())
