return {
	"tpope/vim-fugitive",
	cmd = "Git",
	keys = {
		{ "<c-g>", "<cmd>Git<cr>" },
		{ "<c-g>d", "<cmd>Gdiff<cr>" },
		{ "<c-g>b", 
			function()
				local cb = function(item)
					-- switch branch if empty
					if item == "" then
						item = "-"
					end
					if item ~= nil then
						vim.cmd("Git switch " .. item)
					end
				end
			    vim.ui.modal_input(
					{ prompt = "To which branch "}, cb, 
					{ border = "rounded", relative = "cursor", height = 1, width = 40 }
				)
			end 
		}
	}
}
