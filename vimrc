set nocp
set ts=2
set sw=2
set so=7
set expandtab
set backspace=eol,start,indent
set smarttab
set nobackup
set number
set nowb
set ruler
set noswapfile
set history=300
set cino=:0,g0,l0
set autoread
set bg=dark
set wildmode=longest,list

" Use pathogen plugin to load Plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" for some reason the csscolor plugin is very slow when run on the terminal
" but not in GVim, so disable it if no GUI is running
if !has('gui_running')
    call add(g:pathogen_disabled, 'vim-css-color')
endif

if has('win32') || has('win64')
    call add(g:pathogen_disabled, 'YouCompleteMe')
endif

call pathogen#infect()

filetype plugin on
filetype indent on

syntax enable

colorscheme herald

" Save all files and run make
map <F5> :wall<CR>:make<CR>

" Make tags
map <F6> :!ctags -R --fields=+iaS --extra=+q --append . /usr/include<CR>

" Prev error after make
map <F7> :cp<CR>

" Next error after make
map <F8> :cn<CR>

" Jump to window
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l

" Auto strip useless space when file is saved
au BufWritePre * :call <SID>StripTrailingWhitespace()

fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l,c)
endfun

" Support encoding detection for gbk and sjs
set fencs=utf-8,ucs-bom,gbk,shift-jis

set fdm=marker

au FileType javascript map <F5> :JSHint<CR>
au FileType less map <F5> :!lessc %<CR>

" YouCompleteMe configuration
let g:ycm_filetype_whitelist = {
      \ 'javascript' : 1,
      \ 'python' : 1,
      \ 'cpp' : 1,
      \ 'java' : 1,
      \ 'clojure' : 1,
      \}
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

