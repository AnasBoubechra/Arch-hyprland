" gl1 to set a numbered list in vimwiki gl* gl- etc...
" Mappings (non recursive)
"insert mode
" Quick tips:
" Press K to toggle help for whaever the cursor is pointing at
" Check out gi binding !!! will insert text in the last edit place !
syntax enable 
filetype plugin indent on       " load file type plugins + indentation
highlight clear StatusLine
set cursorline
set clipboard+=unnamedplus
set nocompatible                " choose no compatibility with legacy vi
set expandtab                   " use spaces, not tabs (optional)
set mouse=a
set encoding=utf-8
set showcmd                     " display incomplete commands
set backspace=indent,eol,start  " backspace through everything in insert mode
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set splitbelow splitright
set tabstop=4
set shortmess=atI " Show “invisible” characters
set softtabstop=4
set shiftwidth=4
set foldmethod=marker
set showmatch
set nowrap
set number
let @o='O```sh<esc>Go```<esc>kA'
let mapleader=","
" Use relative line numbers
" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction noremap <leader>ss :call StripWhitespace()<CR> " Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Remove default mapping
nnoremap <C-r> <nop>"{{{
nnoremap <C-p> <nop>
nnoremap <C-h> <nop>
inoremap jk <esc>"}}}
imap <C-a> ä
imap <C-o> ö
imap <C-u> ü
imap <C-e> ë
imap <C-S> ß


iabbrev news {{< newsletter >}}
iabbrev details {{< details "Click to expand" >}}
iabbrev fig {{< figure align=right src="/img/fig.webp" >}}

vnoremap Q ggVGdd"{{{
vnoremap b :g/^$/d<cr>
vnoremap L :left<cr>
vnoremap R :right<cr>
vnoremap C :center<cr>
xnoremap <c-p>  :m-2<CR>gv=gv
xnoremap <c-o> :m'>+<cr>gv=gv 
vnoremap <silent><space> zf 
vnoremap f gq"}}}

" U to capitalize characters
" I have it set to redo
"normal mode  
nmap <tab> gcap  
nnoremap 8 :vertical resize -5<cr>
nnoremap 7 :vertical resize +5<cr>
nnoremap <leader><space> v$y
nnoremap <space> za
nnoremap e b
nnoremap U <c-r>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> f :Files<cr>
" nnoremap  <c-h> :History<cr>
nnoremap m :Lines<cr>
nnoremap <c-j> <c-w>w
nnoremap <leader>d :!pt_vi<CR>
nnoremap <c-k> <c-w>w
nnoremap <C-S>d :setlocal spell! spelllang=de<CR>
nnoremap <C-S>f :setlocal spell! spelllang=fr<CR>
nnoremap <C-S>e :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>c :w! \| !compiler "<c-r>%"<CR>
nnoremap <leader>g :w! \| !compiler "<c-r>%"<CR>
""Autocmd
"augroup remember_folds"{{{
"  autocmd BufWinLeave *.* mkview
"  autocmd BufWinEnter *.* silent! loadview
"augroup END
augroup fileau
    autocmd!
    autocmd FileType markdown nnoremap <leader>b viw<esc>a__<esc>bi__<esc>w
    autocmd FileType markdown nnoremap <leader>p :!pandoc_md_to_html %<cr>
    autocmd FileType markdown nnoremap <leader>m :!pandoc_md_to_html_v2 %<cr>
    autocmd FileType markdown nnoremap <leader>g :!pandoc_md_to_pdf %<cr>
    autocmd FileType markdown nnoremap <leader>s :%s/b-anas.me/cschad.tech/g %<cr>
    autocmd FileType markdown nnoremap <leader>f vedi[<esc>pa]()<esc>
    autocmd FileType html nnoremap <silent> <leader>p :!librewolf %<cr>
    autocmd FileType markdown nnoremap <leader>B viw<esc>a`<esc>bi`<esc>w
    autocmd FileType markdown nnoremap <leader>i viw<esc>a_<esc>bi_<esc>w
    autocmd FileType markdown map <leader>j `>a```c<ESC>`<i```<ESC>
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END


" let
let g:clang_library_path='/usr/lib64/libclang.so.3.8'"{{{
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:indentLine_fileTypeExclude = ["vimwiki", "coc-explorer", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "incv"
let g:indentLine_conceallevel = 2
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = "•"
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_color_term = 239



"plug
call plug#begin('~/.vim/plugged')"{{{
Plug 'Yggdroot/indentLine'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
call plug#end()"}}}
