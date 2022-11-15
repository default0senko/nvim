if &compatible
	  set nocompatible               " Be iMproved
endif

"runtimepath 
	set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
 	runtime map.vim 
	
"write dein script
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

		call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
		call dein#load_toml('~/.config/nvim/plugins.toml')

	call dein#end()
call dein#save_state()
endif
  
"config 
	filetype plugin indent on
	syntax enable
	set number
  
"If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif
  
"ddc.vim
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
	    \ 'vim-lsp': {
            \   'mark': 'lsp',
            \ },
            \ })

" <TAB>: completion.
 inoremap <silent><expr> <TAB>
 \ pumvisible() ? '<C-n>' :
 \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
 \ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
 inoremap <expr><S-TAB>  pumvisible() ? '<C-;>' : '<C-h>'

" Use ddc.
 call ddc#enable()
  
