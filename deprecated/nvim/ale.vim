let g:ale_disable_lsp = 1
let b:ale_fixers = {
            \'python': ['autopep8']
            \}
let g:ale_linters = {
            \'python': ['flake8'],
            \'markdown': ['markdownlint', 'writegood'],
            \'shell': ['shellcheck'],
            \'bash': ['shellcheck'],
            \}
let g:ale_python_flake8_options = '--max-line-length=250'
let g:ale_sh_bashate_options = '-i E003,E006'
