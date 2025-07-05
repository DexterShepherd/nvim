vim.api.nvim_create_user_command("OpenDailyNote", function()
  local formatted_date = os.date("%Y-%m-%d")
  local path = string.format("~/Documents/notes/%s.md", formatted_date)
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

-- vim.api.nvim_create_user_command("ShowReferencingFiles", function()
--   local current_file = vim.fn.expand("%:t:r") -- Get filename without extension
--   if current_file == "" then
--     print("No file is currently open")
--     return
--   end
--
--   -- Search for markdown files that reference the current file in current working directory
--   local cwd = vim.fn.getcwd()
--   local current_file_path = vim.fn.expand("%:p")
--
--   local function on_exit(obj)
--     if obj.code ~= 0 then
--       print("No referencing files found")
--       return
--     end
--
--     local files = {}
--     for line in obj.stdout:gmatch("[^\r\n]+") do
--       -- Exclude the current file from results
--       if line ~= current_file_path then
--         table.insert(files, line)
--       end
--     end
--
--     if #files == 0 then
--       print("No referencing files found")
--       return
--     end
--
--     print("Found " .. #files .. " files referencing " .. current_file)
--
--     -- Use snacks picker to display results (defer to avoid fast event context)
--     vim.schedule(function()
--       require("snacks").picker({
--         title = "Files referencing " .. current_file,
--         format = "file",
--         items = vim.tbl_map(function(file)
--           return { text = file, file = file }
--         end, files),
--       })
--     end)
--   end
--
--   vim.system({ "rg", "-l", current_file, cwd, "--type", "md" }, {
--     text = true,
--   }, on_exit)
-- end, {})
