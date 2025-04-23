return {
	dir = "/home/losch@alabsad.fau.de/Documents/ztl/nvim",
	name = "ztl",
	lazy = false,
	opts = {
		make_locally_available = function(remote_file)
			return remote_file
		end,

		pdf_viewer = function(url, page, search) 
			-- local url = "https://zettel.haus/source/" .. url 
			local cmd = "ssh -o StrictHostKeyChecking=no lorenz@localhost -p 2020 'DISPLAY=:0.0 ~/.local/bin/cachepdf " .. url

			if page ~= nil then
				cmd = cmd .. " --page " .. page
			end

			if search ~= nil then
				cmd = cmd .. " --find \"" .. search .. "\""
			end

			return cmd .. "'"
		end,

		url_viewer = function(url, page, search) 
			return "ssh -o StrictHostKeyChecking=no lorenz@localhost -p 2020 'DISPLAY=:0.0 firefox " .. url .. "'"
		end
	},
}
