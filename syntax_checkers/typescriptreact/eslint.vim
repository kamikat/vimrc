if exists('g:loaded_syntastic_typescriptreact_eslint_checker')
    finish
endif
let g:loaded_syntastic_typescriptreact_eslint_checker = 1

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'typescriptreact',
    \ 'name': 'eslint',
    \ 'redirect': 'javascript/eslint'})
