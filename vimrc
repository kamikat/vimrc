set nocp
set ts=4
set sw=4
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
" set textwidth=76
" colorscheme xoria256 
set bg=dark
set wildmode=longest,list

" Use pathogen plugin to load Plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

filetype plugin on
filetype indent on

syntax enable

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

" Force use 4 ws other than tab indent for python
au FileType python setlocal et
au FileType html setlocal textwidth=0

" Set XAML to be parsed as XML
au BufRead,BufNewFile *.xaml    setfiletype xml

" Support encoding detection for gbk and sjs
set fencs=utf-8,ucs-bom,gbk,shift-jis

" Variables for html indent plugin
let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 

au FileType html,jade,markdown setlocal ts=2 sw=2

au FileType markdown setlocal textwidth=76

au FileType javascript,python setlocal fdm=marker