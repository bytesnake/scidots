return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	init = function()
		vim.o.cmdheight = 0
	end,
	opts = {
		theme = "gruvbox",
	}
}
