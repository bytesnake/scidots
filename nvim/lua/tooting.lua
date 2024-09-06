--vim.keymap.set('x', '<c-t>', function()
vim.api.nvim_create_user_command('Toot', function(opts)
	local selected_text = vim.api.nvim_buf_get_lines( 0, opts.line1 - 1, opts.line2, true)
	text = ""
	for key, value in pairs(selected_text) do
		text = text .. value .. "\n"
	end

	if vim.fn.executable('toot') ~= 1 then
		print("No tooting command found in $PATH!")
		return
	end

	local job = vim.fn.jobstart("toot post -v public -t text/markdown '" .. text .. "'", {
		on_exit = function(jobid, data, event)
			if data == 0 then
				vim.notify("Toot successful", {title="Mighty Mastodon"})
			else
				vim.notify("Publishing toot was not successful :(", "error", {title="Mighty Mastodon"})
			end
		end
	})

end, {nargs = 0, range=true})
