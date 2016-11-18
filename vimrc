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
set wildmode=longest,list

" Never recognizes leading zero number as octal number
set nrformats-=octal

" Use pathogen plugin to load Plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

let g:pathogen_disabled = []

call add(g:pathogen_disabled, 'vim-autocomplpop')

call pathogen#infect()

filetype plugin on
filetype indent on

syntax enable

colorscheme heraldish

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

let g:tex_flavor='latex'

" Turn off gitgutter by default
let g:gitgutter_enabled = 1

" Use eslint
let g:syntastic_javascript_checkers = ['eslint']

" YAML front matter for Markdown
let g:vim_markdown_frontmatter = 1

