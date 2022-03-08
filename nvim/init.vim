" Vim/nVim .vimrc
" Author: Archie Hilton
" Email	:	archie.hilton1@gmail.com

let mapleader=','


" let g:clipboard = {
" 	  \   'name': 'myClipboard',
" 	  \   'copy': {
" 	  \      '+': 'wl-copy',
" 	  \      '*': 'wl-copy',
" 	  \    },
" 	  \   'paste': {
" 	  \      '+': 'xsel -bo',
" 	  \      '*': 'xsel -bo',
" 	  \   },
" 	  \   'cache_enabled': 1,
" 	  \ }

" Swap : and ;. : is used way more
set nocompatible
filetype plugin on
filetype indent on
syntax on
set encoding=utf-8
set number relativenumber
set nohlsearch
set tabstop=4
" set softtabstop
set noexpandtab
set shiftwidth=0
set ignorecase
set smartcase
set wrap
set linebreak
set visualbell
set numberwidth=6
set foldlevelstart=99

set background=dark


set vb
set t_vb=

" autocmd FileType tex set foldmethod=syntax
autocmd FileType c,cpp,sh,python,lisp call HLCC ()

nnoremap <leader>p :!lualatex %<CR><CR>
nnoremap <leader>o :!zathura *.pdf &<CR><CR>

" Disable jiangmiao's autopairs for lisp
au FileType lisp let b:autopairs_loaded=1

" Splits open at the bottom and right
set splitbelow splitright


" Set Spelling
nnoremap <leader>s :set spell!<CR>
" Visual dragging
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" LaTeX
nnoremap <leader>z i\section{}<ESC>i
nnoremap <leader><leader>z i\subsection{}<ESC>i
nnoremap <leader><leader><leader>z i\subsubsection{}<ESC>i
nnoremap <leader>be i\begin{<++>}<CR>\end{<++>}<ESC>Vk:s/<++>/
nnoremap <leader>bo a\textbf{

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" Faster Quitting if no changes were made
" nnoremap zz :q<CR>

" Highlight 81st column
function! HLCC ()
	highlight ColorColumn ctermbg=yellow
	call matchadd('ColorColumn', '\%81v', 100)
endfunction

" This rewires n and N to do the highlighing
nnoremap <silent> n   n:call HLNext(0.01)<cr>
nnoremap <silent> N   N:call HLNext(0.01)<cr>

" Blink the line containing the match
function! HLNext (blinktime)
	set invcursorline
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	set invcursorline
	redraw
endfunction

" Make tabs, trailing whitespace and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
nnoremap & :set list!<CR>

" Enable Goyo
nnoremap gy :Goyo<CR>

" Easier Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-n> :tabn<CR>

" Start swank server
let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/plugged/slimv/slime/start-swank.lisp"'

" Syntax Finder
function! GetSyntaxID()
    return synID(line('.'), col('.'), 1)
endfunction

function! GetSyntaxParentID()
    return synIDtrans(GetSyntaxID())
endfunction

function! GetSyntax()
    echo synIDattr(GetSyntaxID(), 'name')
    exec "hi ".synIDattr(GetSyntaxParentID(), 'name')
endfunction
