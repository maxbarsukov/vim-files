set nocompatible

syntax on

set expandtab
set smarttab
set et
set tabstop=4
set softtabstop=4

set shiftwidth=4
set autoindent

set number

set encoding=utf8
set ffs=unix,dos,mac

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

" Error bells
set noerrorbells
set novisualbell

set pastetoggle=<F10>

set backspace=indent,eol,start

set cindent
set nomodeline
set mouse=a
set wildignore=*.swp,*.bak,*.pyc,*/.git/**/*,*/.hg/**/*,*/.svn/**/*

set foldmethod=indent

set nuw=4
set ai
set cin

set lz

set list
set listchars=eol:⏎,tab:··,nbsp:⎵

filetype plugin indent on
syntax enable
source ~/.vim/mappings.vim
source ~/.vim/plugs.vim

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction


set splitbelow
set splitright


" Auto-open NERDTree
" autocmd CursorHold,CursorHoldI * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w
if 0 != argc()
    silent! autocmd VimEnter * NERDTree %
    silent! autocmd BufWinEnter * NERDTree %:p:h

    silent! autocmd VimEnter * wincmd w
end

" Comments
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal commentstring={/*\ %s\ */}

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:tablineclosebutton=1

let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000


let g:ale_linters = {
            \   'python': ['flake8', 'pylint'],
            \   'ruby' : ['rubocop', 'solargraph'],
            \   'javascript': ['eslint'],
            \   'vue': ['eslint']
            \}

let g:ale_fixers = {
            \    'javascript': ['eslint'],
            \    'typescript': ['prettier', 'tslint'],
            \    'vue': ['eslint'],
            \    'ruby' : ['rubocop', 'solargraph'],
            \    'scss': ['prettier'],
            \    'html': ['prettier'],
            \    'reason': ['refmt']
            \}
let g:ale_fix_on_save = 1


function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '✨ all good ✨' : printf(
                \   '😞 %dW %dE',
                \   all_non_errors,
                \   all_errors
                \)
endfunction

let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

let g:vimrubocop_config = '~/prog/ruby/rubocop.yml'
set autoread

let g:syntastic_javascript_checkers = ['eslint']

" autofix with eslint
let g:syntastic_javascript_eslint_args = ['--fix']
function! SyntasticCheckHook(errors)
    checktime
endfunction

" disable syntastic on the statusline
let g:statline_syntastic = 0

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:formatprg_args_javascript = "-j -q -B -f -"

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_list_window_size = 5


let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
" Fix files automatically on save
let g:ale_fix_on_save = 1


let g:syntastic_auto_jump           = 1
let g:syntastic_error_symbol        = '✖'
let g:syntastic_warning_symbol      = '►'
let g:syntastic_javascript_checkers = ['jshint'   ] " sudo npm install -g jshint
let g:syntastic_html_checkers       = ['jshint'   ] " sudo npm install -g jshint
let g:syntastic_ruby_checkers       = ['rubylint' ] " gem install ruby-lint
let g:syntastic_haml_checkers       = ['haml-lint'] " gem install haml-lint
let g:syntastic_css_checkers        = ['csslint'  ] " sudo npm install -g csslint
let g:syntastic_css_csslint_args    = "--ignore=zero-units"


let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this               = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                = "ℕ"
" let g:javascript_conceal_prototype          = "¶"
" let g:javascript_conceal_static             = "•"
" let g:javascript_conceal_super              = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"

augroup  javascript_folding
    au!
    au  FileType javascript setlocal foldmethod=syntax
augroup  END


let javascript_enable_domhtmlcss = 1

let g:html_indent_inctags        = "html,body,head,tbody"
let g:html_indent_script1        = "inc"
let g:html_indent_style1         = "inc"

" let g:indentLine_setColors = 0
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled    = 1
let g:indentLine_char       = '¦'
" let g:indentLine_color_term = 239
" let g:indentLine_color_gui  = '#A4E57E'
let b:current_syntax       = 'javascript'
let g:used_javascript_libs = 'angularjs'

augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


set conceallevel=1



" Function: display errors from Ale in statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf(
                \ 'W:%d E:%d',
                \ l:all_non_errors,
                \ l:all_errors
                \)


    set statusline=
    set statusline+=%m
    set statusline+=\ %f
    set statusline+=%=
    set statusline+=\ %{LinterStatus()}

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " let g:deoplete#enable_at_startup = 1
endfunction
"set laststatus=2
"set statusline=
"set statusline+=\ %l
"set statusline+=\ %*
"set statusline+=\ ‹‹
"set statusline+=\ %f\ %*
"set statusline+=\ ››
"set statusline+=\ %m
"set statusline+=\ %F
"set statusline+=%=
"set statusline+=\ %{LinterStatus()}
"set statusline+=\ ‹‹
""set statusline+=\ %{strftime('%R', getftime(expand('%')))}
"set statusline+=\ ::
"set statusline+=\ %n
"set statusline+=\ ››\ %*


set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)

"Сам по себе number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсор

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам

"Предыдущий способ известен как soft
"wrapping
""При желании вы можете заставить Вим насильно разделять...
"... строчки в самом тексте вот так:
set textwidth=80 "Где 80 стоит заменить на нужную вам длину строки

set cursorline "А так мы можем подсвечивать строку с курсором

"Если вы используете обычный терминальный Вим, а не NeoVim, то...
"... для изменения курсора в разных режимах используйте это:
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта

let g:ruby_path = '.rvm/rubies/ruby-3.0.0/bin/ruby'
let g:LanguageClient_serverCommands = {
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
            \ }

let g:slime_target = "vimterminal"
let g:kite_supported_languages = ['*']



" COC NVIM CONFIG

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" TODO
" Highlight symbol under cursor on CursorHold
silent autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}




" DEOPLATE

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif



" Colorscheme
colorscheme onedark
" colorscheme afterglow

" Put to colors/afterglow.vim let s:selection = "353535"

" colorscheme onedark
set background=dark
" set background=light

let g:airline_theme='onedark'
" let g:airline_theme='afterglow'

" let g:afterglow_blackout=1
" let g:afterglow_italic_comments=1
" let g:afterglow_inherit_background=1
" hi Normal guibg=NONE ctermbg=NONE

" Font
" Also need Meslo for icons https://github.com/andreberg/Meslo-Font
set guifont=JetBrains\ Mono\ 13

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

