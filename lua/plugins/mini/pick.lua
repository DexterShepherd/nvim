local later = MiniDeps.later

local function send_to_quickfix()
	local items = MiniPick.get_picker_items()

	if not items or #items == 0 then
		print("No items found in the picker")
		return
	end

	local qf_items = {}

	for _, item in ipairs(items) do
		local qf_item
		if type(item) == "string" then
			local parts = vim.split(item, "\000")
			qf_item = {
				filename = parts[1],
				lnum = tonumber(parts[2]) or 1,
				col = tonumber(parts[3]) or 1,
				text = parts[4] or "",
			}
		elseif type(item) == "table" then
			qf_item = {
				filename = item.filename or item.path or "",
				lnum = item.lnum or 1,
				col = item.col or 1,
				text = item.text or "",
			}
		end

		if qf_item and qf_item.filename ~= "" then
			table.insert(qf_items, qf_item)
		end
	end

	if #qf_items == 0 then
		print("No valid items to add to quickfix list")
		return
	end

	vim.fn.setqflist(qf_items)
	vim.cmd("copen")
	MiniPick.stop()

	print(#qf_items .. " item(s) sent to quickfix list")
end

function config()
	require("mini.pick").setup({
		options = { use_cache = true },
		mappings = {
			send_to_qf = {
				char = "<C-q>",
				func = send_to_quickfix,
			},
		},
	})

	vim.keymap.set("n", "<leader>sf", MiniPick.builtin.files, { desc = "[Search Files] pick fro files with mini.pick" })

	vim.keymap.set(
		"n",
		"<leader>sg",
		MiniPick.builtin.grep_live,
		{ desc = "[Search Grep] grep for file content with mini.pick" }
	)

	vim.keymap.set(
		"n",
		"<leader>sh",
		MiniPick.builtin.help,
		{ desc = "[Search help] pick from helptags with mini.pick" }
	)

	vim.keymap.set("n", "<leader>sr", MiniPick.builtin.resume, { desc = "[Search help] resume last picker" })

	vim.keymap.set(
		"n",
		"<leader>sc",
		MiniExtra.pickers.commands,
		{ desc = "[Search commands] pick from commands with mini.pick" }
	)

	vim.keymap.set(
		"n",
		"<leader>sd",
		MiniExtra.pickers.diagnostic,
		{ desc = "[Search diagnostic] pick from diagnostics with mini.pick" }
	)

	vim.keymap.set(
		"n",
		"<leader>sk",
		MiniExtra.pickers.keymaps,
		{ desc = "[Search diagnostic] pick from diagnostics with mini.pick" }
	)

	vim.ui.select = MiniPick.ui_select
end

later(config())
