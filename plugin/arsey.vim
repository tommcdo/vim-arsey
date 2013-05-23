function! s:arsie()
	if ! exists('g:arsie_vimrc_file')
		let g:arsie_vimrc_file = '.vimrc'
	endif
	if ! exists('g:arsie_vimrc_directory')
		let g:arsie_vimrc_directory = '.;'
	endif
	if ! exists('g:arsie_vimrc_all')
		let g:arsie_vimrc_all = 1
	endif

	let files = findfile(g:arsie_vimrc_file, g:arsie_vimrc_directory, -1)
	let files = filter(files, "v:val != $MYVIMRC")
	if g:arsie_vimrc_all
		let files = reverse(files)
	else
		let files = [files[0]]
	endif

	for file in files
		exec 'source '.file
	endfor
endfunction

call s:arsie()
