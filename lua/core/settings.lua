local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.ignorecase = true
o.smartcase = true

o.clipboard = "unnamedplus"

vim.api.nvim_set_option("clipboard", "unnamed")
vim.api.nvim_set_option("relativenumber", true)

vim.cmd("filetype plugin indent on") -- Enable all filetype plugins

if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
	vim.cmd("OpenDailyNote")
end
