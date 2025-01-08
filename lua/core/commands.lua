vim.api.nvim_create_user_command("OpenMessageWindow", function()
	vim.cmd("split | terminal")
	vim.fn.termopen("tail -f " .. vim.fn.fnameescape(vim.fn.stdpath("log") .. "/log"))
end, {})

vim.api.nvim_create_user_command("OpenDailyNote", function()
	local formatted_date = os.date("%Y-%m-%d")
	local path = string.format("~/Documents/notes/dailies/%s.md", formatted_date)
	vim.cmd(string.format("tab drop %s", path))
	vim.cmd("tcd ~/Documents/notes")
end, {})

vim.api.nvim_create_user_command("DailyNote", function()
	local formatted_date = os.date("%Y-%m-%d")
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local text = string.format("[[%s]]", formatted_date)
	-- Notice the uuid is given as an array parameter, you can pass multiple strings.
	-- Params 2-5 are for start and end of row and columns.
	-- See earlier docs for param clarification or `:help nvim_buf_set_text.
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { text })
end, {})

vim.api.nvim_create_user_command("Reload", function()
	vim.cmd("source %")
end, {})
