"dein Scripts-----------------------------
if &compatible  
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/default_87/.cache/dein//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/default_87/.cache/dein/')

"Let dein manage dein
" Required:
"call dein#add('/home/default_87/.cache/dein//repos/github.com/Shougo/dein.vim')
"call dein#add('Shougo/vimproc.vim', { 'build' : 'make'}) 

 " Add or remove your plugins here like this:
 "call dein#add('Shougo/neosnippet.vim')
 "call dein#add('Shougo/neosnippet-snippets')

" If you want to install not installed plugins on startup.
"if dein#check_install()
"call dein#install()
"endif

"End dein Scripts-------------------------

"runtime
runtime maps.vim
runtime setting.vim

"tomlファイル読み込み(プラグイン管理)
let s:toml_dir = expand('~/.config/nvim')
let s:dein_dir = expand('~/.cache/dein')

"dein settings
if dein#load_state(s:dein_dir)
	"Load TOML
	let s:toml = s:toml_dir . '/dein.toml'

	call dein#load_toml(s:toml, {'lazy': 0})
endif

"finalize
call dein#end()
call dein#save_state()

" plugin installation check
if dein#check_install()
	call dein#install()
endif

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

" Required:
filetype plugin indent on
set number
syntax enable
set autoindent
set smartindent
set cursorline	

" vim-indent-guideline
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=pink   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=orange ctermbg=4

