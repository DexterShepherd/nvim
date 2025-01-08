local sync_to_coder = function()
	local setup = function()
		vim.notify("Setting up coder integration")
		local server

		vim.ui.select({
			"coder.workspace.main",
			"coder.si-8.main",
			"coder.si.main",
		}, { prompt = "Select server" }, function(choice)
			server = choice
		end)

		if not server then
			vim.notify("No server selected")
			return
		end

		vim.notify(string.format("Server set to %s", server))
		vim.api.nvim_create_augroup("coder", { clear = true })

		local on_write = function(args)
			local path = vim.api.nvim_buf_get_name(args.buf)
			vim.notify(string.format("syncing %s", path))
			local path_on_coder = path:match(".*/runway/(.*)$")

			local dest = string.format("root@%s:%s", server, path_on_coder)
			local command = string.format("scp %s %s", vim.fn.shellescape(path), vim.fn.shellescape(dest))

			local function on_exit(job_id, exit_code, event_type)
				if exit_code == 0 then
					vim.notify(string.format("%s successfully updated", path_on_coder))
				else
					vim.notify(string.format("Error copying %s to coder", path_on_coder), vim.log.levels.ERROR)
				end
			end

			vim.fn.jobstart(command, {
				on_exit = on_exit,
			})
		end

		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "coder",
			pattern = "*/streaming-inference/*",
			callback = on_write,
		})

		vim.api.nvim_create_user_command("CoderSync", function()
			local command = string.format(
				"rsync -var ~/workspace/runway/streaming-inference/src/ root@%s:~/streaming-inference/src/",
				server
			)
			vim.cmd(string.format("silent !tmux display-popup %s", command))
		end, {})
	end

	vim.api.nvim_create_user_command("Coder", setup, {})
end

MiniDeps.later(sync_to_coder())
