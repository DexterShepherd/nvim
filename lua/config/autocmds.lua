-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.ck",
  callback = function()
    vim.opt_local["commentstring"] = "// %s"
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ck",
  callback = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd([[ normal gg=G]])
    vim.api.nvim_win_set_cursor(0, { line, col })
  end,
})
