local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
o.ignorecase = true
o.smartcase = true

o.clipboard = "unnamedplus"

vim.api.nvim_set_option("clipboard", "unnamed")
