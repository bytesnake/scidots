return {
	dir = "/home/losch@alabsad.fau.de/Documents/ztl/nvim",
	name = "ztl",
	lazy = false,
	opts = {
		pdf_viewer = function(url, page, search) 
			local cmd = "ssh lorenz@localhost -p 2020 'DISPLAY=:0.0 okular --unique " .. url

			if page ~= nil then
				cmd = cmd .. " --page " .. page
			end

			if search ~= nil then
				cmd = cmd .. " --find " .. search
			end

			return cmd .. "'"
		end
	},
}
