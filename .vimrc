"TODO
"
" 1) TODO highlighting
" 2) TODO tree
" 3) Projects & etc
" 4) Num lists
" 6) emoji instead of NORMAL. INSERT, etc
" 7) Tabman
" 8) Better status line
"

set nocompatible

syntax on
set hidden

set expandtab
set smarttab
set et
set tabstop=4
set softtabstop=4

set shiftwidth=4
set autoindent

set number
set relativenumber

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

set noswapfile
set nobackup
set nowb

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

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


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

let NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0


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
            \   'ruby' : ['rubocop', 'prettier', 'rufo', 'standardrb'],
            \   'javascript': ['eslint'],
            \   'vue': ['eslint']
            \}

let g:ale_fixers = {
            \    'javascript': ['eslint'],
            \    'typescript': ['prettier', 'tslint'],
            \    'vue': ['eslint'],
            \    'ruby' : ['rubocop', 'standardrb', 'prettier', 'sorbet', 'rufo'],
            \    'scss': ['prettier'],
            \    'html': ['prettier'],
            \    'reason': ['refmt']
            \}
let g:ale_fix_on_save = 1

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
let g:statline_syntastic = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:formatprg_args_javascript = "-j -q -B -f -"

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

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


set conceallevel=3



" Function: display errors from Ale in statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction


let g:deoplete#enable_at_startup = 1

set laststatus=2
set statusline=
set statusline+=\ %l
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
set statusline+=\ %m
set statusline+=\ %F
set statusline+=%=
set statusline+=\ %{LinterStatus()}


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

set statusline+=%{get(b:,'gitsigns_status','')}

set statusline+=\ ‹‹
"set statusline+=\ %{strftime('%R', getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

function! Transparent()
    hi Normal guibg=NONE ctermbg=NONE
    hi CursorLine guibg=NONE ctermbg=NONE
    hi StatusLine ctermbg=NONE guibg=NONE

    hi airline_c  ctermbg=NONE guibg=NONE

    hi airline_tabfill ctermbg=NONE guibg=NONE
endfunction

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

let g:ruby_path = '.rvm/rubies/ruby-2.7.2/bin/ruby'
let g:LanguageClient_serverCommands = {
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'ruby': ['~/.rvm/gems/ruby-2.7.2@global/gems/rubocop-1.12.1', 'stdio'],
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
autocmd FileType tagbar,nerdtree setlocal signcolumn=no

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


" Color highlighting
let g:Hexokinase_highlighters = ['backgroundfull']

" Ranger settings
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" DEOPLATE
" For conceal markers.
if has('conceal')
    set conceallevel=3 concealcursor=niv
endif


let g:startify_custom_header = [
 \ '',
 \ '|                     ▟▙            ',
 \ '|                     ▝▘            ',
 \ '|           ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '|           ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '|            ▜█▙▟█▛   ██  ██  ██  ██',
 \ '|            ▝████▘   ██  ██  ██  ██',
 \ '|              ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '|',
 \ '',
 \ '',
 \]


" \'    __  __     ____',
" \'   / / / /__  / / /___       ____ ___  ____ __  __',
" \'  / /_/ / _ \/ / / __ \     / __ `__ \/ __ `/ |/_/',
" \' / __  /  __/ / / /_/ /    / / / / / / /_/ />  <',
" \'/_/ /_/\___/_/_/\____( )  /_/ /_/ /_/\__,_/_/|_|',
" \'                     |/',
" \'',
" \'',
" \]
 " \ '',
 " \ '                                                    ▟▙            ',
 " \ '                                                    ▝▘            ',
 " \ '            ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 " \ '            ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 " \ '            ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 " \ '            ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 " \ '            ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 " \ '',
 " \ '',
 " \ '',
 " \]

" Colorscheme
colorscheme onedark
" colorscheme afterglow


" Put to colors/afterglow.vim let s:selection = "353535"

" colorscheme onedark
set background=dark
" set background=light

let g:airline_theme='onedark'
" let g:airline_theme='afterglow'

"let g:afterglow_blackout=1
" let g:afterglow_italic_comments=1
" let g:afterglow_inherit_background=1
" hi Normal guibg=NONE ctermbg=NONE

" Font
" Also need Meslo for icons https://github.com/andreberg/Meslo-Font
set guifont=JetBrains\ Mono\ 13

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

let g:ale_completion_autoimport = 1

" Emoji
set completefunc=emoji#complete
" let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
" let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
" let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
" let g:gitgutter_sign_modified_removed = emoji#for('collision')

set t_Co=256
set termguicolors

let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_sign_allow_clobber = 0
"hi DiffAdd  term=bold ctermfg=235 ctermbg=114 guifg=#282C34 guibg=#98C379

hi DiffAdd      term=bold ctermfg=114 ctermbg=235 guifg=#98C379 guibg=#282C34

" hi DiffChange   term=bold cterm=underline ctermfg=180 gui=underline guifg=#E5C07B
" hi DiffDelete   term=bold ctermfg=235 ctermbg=204 guifg=#282C34 guibg=#E06C75
" hi DiffText     term=reverse ctermfg=235 ctermbg=180 guifg=#282C34 guibg=#E5C07B

hi DiffDelete   term=bold ctermfg=204 ctermbg=235 guifg=#E06C75 guibg=#282C34
hi DiffText     term=reverse ctermfg=180 ctermbg=235 guifg=#E5C07B guibg=#282C34
hi DiffChange   term=bold cterm=NONE ctermfg=180 gui=NONE guifg=#E5C07B
hi Search       term=reverse ctermfg=235 ctermbg=38 guifg=#282C34 guibg=#38b3cc
hi IncSearch    term=reverse ctermfg=38 ctermbg=59 guifg=#38b3cc guibg=#5C6370

