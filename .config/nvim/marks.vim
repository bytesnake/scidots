" small helper function to extract annotations into new buffer
function! s:ExtractAnnotations()
	let file = expand('%:r') . "-marks.vim"
	call writefile(mark#GetDefinitionCommands(1), file, 'b')
endfunction

" small helper function to load annotations
function! s:LoadAnnotations()
	let file = expand('%:r') . "-marks.vim"
	if filereadable(file)
		exec "source " . file
	endif
endfunction

" don't use leader, remap to m
map mm <Leader>m
map mc <Leader>n
map mr <Leader>r
map ms :call <SID>ExtractAnnotations()<CR>

" restrict number of marks to 5
let g:mwDefaultHighlightingNum = 5

" automatically load marks
let g:mwAutoLoadMarks = 0
let g:mwAutoSaveMarks = 0

" autoload extension
autocmd BufRead * call <SID>LoadAnnotations()
