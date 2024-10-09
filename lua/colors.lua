-- if not vim.g.vscode then
-- 	vim.cmd([[colorscheme rose-pine]])
-- 	local handle = io.popen("dark-mode status")
-- 	if handle == nil then
-- 		return
-- 	end
-- 	local result = handle:read("*a")
-- 	handle:close()
-- 	result = result:match("^%s*(.-)%s*$") -- Trim leading and trailing whitespace
-- 	if result == "off" then
-- 		vim.opt.background = "light"
-- 	else
-- 		vim.opt.background = "dark"
-- 	end
-- end

vim.o.termguicolors = true
vim.cmd([[colorscheme rose-pine-moon]])
vim.opt.background = "dark"
