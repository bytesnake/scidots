" small helper function to extract annotations into new buffer
function! s:ExtractAnnotations()
	echo mark#GetDefinitionCommands(0)
endfunction

" don't use leader, remap to m
map mm <Leader>m
map mc <Leader>n
map mr <Leader>r
map ms :call <SID>ExtractAnnotations()<CR>

" restrict number of marks to 5
let g:mwDefaultHighlightingNum = 5

" automatically load marks
let g:mwAutoLoadMarks = 1
