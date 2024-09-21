vim.api.nvim_create_user_command("OpenMessageWindow", function()
	vim.cmd("split | terminal")
	vim.fn.termopen("tail -f " .. vim.fn.fnameescape(vim.fn.stdpath("log") .. "/log"))
end, {})
