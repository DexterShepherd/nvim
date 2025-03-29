-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.cmd("OpenDailyNote")
end

vim.g.snacks_animate = false
