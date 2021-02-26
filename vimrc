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

" Disable modeline feature for security (CVE-2019-12735)
set nomodeline

" Use pathogen plugin to load Plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim

let g:pathogen_disabled = []

call add(g:pathogen_disabled, 'vim-autocomplpop')

call pathogen#infect()

filetype plugin on
filetype indent on

syntax enable

colorscheme heraldish

" Force buffer redraw
map <F5> :redr!<CR>

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

" :w!!
" write the file when you accidentally opened it without the right (root) privileges
cmap w!! w !sudo tee % > /dev/null

" Auto strip useless space when file is saved
au BufWritePre * :call <SID>StripTrailingWhitespace()

fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l,c)
endfun

" Binary editing mode
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" Support encoding detection for gbk and sjs
set fencs=utf-8,ucs-bom,gbk,shift-jis

set fdm=marker

let g:tex_flavor='latex'

" Turn off gitgutter by default
let g:gitgutter_enabled = 1

" Use eslint
let g:syntastic_javascript_checkers = ['eslint']

" YAML front matter for Markdown
let g:vim_markdown_frontmatter = 1

" Disable folding for Markdown
let g:vim_markdown_folding_disabled = 1

let g:vim_markdown_fenced_languages = ['jsx=javascript']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'
