return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  init = function()
    vim.g.vimtex_view_method = "general"
	vim.g.vimtex_view_general_method = "okular"
	vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
  end
}
