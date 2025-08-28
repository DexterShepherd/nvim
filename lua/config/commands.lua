vim.api.nvim_create_user_command("OpenDailyNote", function()
  local formatted_date = os.date("%Y-%m-%d")
  local path = string.format("~/Documents/notes/Dailies/%s.md", formatted_date)
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

vim.api.nvim_create_user_command("ToggleTheme", function()
  local dark = "rose-pine-moon"
  local light = "rose-pine-dawn"
end, {})

-- Auto-detect and watch for dark/light mode changes
local function set_background_from_system()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()

  if result:match("Dark") then
    vim.o.background = "dark"
  else
    -- vim.o.background = "light"
    vim.o.background = "dark"
  end
end

-- Set on startup
set_background_from_system()

vim.api.nvim_create_user_command("UpdateBackground", set_background_from_system, {})

-- Check periodically when Neovim gains focus
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "UpdateBackground",
})
