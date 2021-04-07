" VIM-PLUG INSTALLATION
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" PLUGINS

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'            " Project and file navigation
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fisadev/FixedTaskList.vim'      " Pending tasks list
Plug 'freeo/vim-kalisi'
" Plug 'sebmaynard/vim-ligatures'
" Plug 'lilydjwg/colorizer'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
"Plug 'Shougo/deoplete.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'neoclide/coc.nvim', {'for':['zig','cmake','rust',
"      \'java','json', 'haskell', 'ts','sh', 'cs',
"      \'yaml', 'c', 'cpp', 'd', 'go',
"     \'python', 'dart', 'javascript', 'vim'], 'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'weirongxu/coc-explorer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-pathogen'
Plug 'joshdick/onedark.vim'

" Snake game. :Snake
Plug 'zyedidia/vim-snake'
Plug 'rakr/vim-one'
Plug 'vim-scripts/gruvbox'
Plug 'kiteco/vim-plugin'
Plug 'Keithbsmiley/investigate.vim'
Plug 'Townk/vim-autoclose'
"Plug 'vim-scripts/FuzzyFinder'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }


Plug 'sheerun/vim-polyglot'

" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
" Plug 'tpope/vim-endwise'
" Plug 'hackhowtofaq/vim-solargraph'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'ngmy/vim-rubocop'


" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-github-dashboard'
"PLug 'jaxbot/github-issues.vim'
Plug 'idanarye/vim-merginal'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'


" Erlang / Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mattreduce/vim-mix'
Plug 'gasparch/vim-ide-elixir'
Plug 'jimenezrick/vimerl'
Plug 'vim-erlang/vim-erlang'
Plug 'vim-erlang/vim-erlang-runtime'


" JS
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript',      { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
" PLug 'mxw/vim-jsx'


" Html / Css
Plug 'mattn/emmet-vim',           { 'for': ['html','xhtml','css','sass','scss','less'] }
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-haml',            { 'for': 'haml'   }
Plug 'wavded/vim-stylus',         { 'for': 'stylus' }
Plug 'groenewege/vim-less',       { 'for': 'less'   }
Plug 'digitaltoad/vim-jade',      { 'for': 'jade'   }
Plug 'slim-template/vim-slim',    { 'for': 'slim'   }
Plug 'othree/html5-syntax.vim',   { 'for': 'html'   }
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss'   }
Plug 'hail2u/vim-css3-syntax',    { 'for': ['html','css'] }
Plug 'alvan/vim-closetag'


" Java
Plug 'artur-shaik/vim-javacomplete2'

" Colorschemes
Plug 'dylanaraps/wal.vim'

Plug 'ayu-theme/ayu-vim'
Plug 'Nequo/vim-allomancer'
Plug 'chasinglogic/ChasingLogic-colorscheme-vim'
Plug 'dsolstad/vim-wombat256i'
Plug 'chriskempson/base16-vim'
Plug 'sickill/vim-monokai'
Plug 'zeis/vim-kolor'
Plug 'mopp/mopkai.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'jacoborus/tender.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'sonph/onehalf'
Plug 'vim-scripts/grishin-color-scheme'
Plug 'svjunic/RadicalGoodSpeed.vim'
Plug 'larssmit/vim-getafe'
Plug 'gilsondev/lizard'
Plug 'therealechan/vim-railscasts-theme'
Plug 'vim-scripts/desertEx'
Plug 'benjaminwhite/Benokai'
Plug 'trusktr/seti.vim'
Plug 'toupeira/vim-desertink'
Plug 'mhartington/oceanic-next'
Plug 'changyuheng/color-scheme-holokai-for-vim'
Plug 'atelierbram/vim-colors_duotones'
Plug 'michalbachowski/vim-wombat256mod'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline-themes'


Plug 'francoiscarbol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Other
Plug 'scrooloose/syntastic', { 'for': ['ruby','html','css', 'javascript', 'haml'] }
Plug 'vim-scripts/dbext.vim'
Plug 'mhinz/vim-startify'
Plug 'cj/vim-webdevicons'
Plug 'enricobacis/vim-airline-clock'
Plug 'skalnik/vim-vroom'
Plug 'mcchrish/nnn.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'osyo-manga/vim-watchdogs'
Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'dannyob/quickfixstatus'




Plug 'skywind3000/asyncrun.vim'
Plug 'Chiel92/vim-autoformat'
"" Plug 'Twinside/vim-haskellConceal'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/tagbar'
Plug 'vim-scripts/taglist.vim'
""" Plug 'tpope/vim-endwise'
Plug 'dense-analysis/ale'

" Plug 'f-person/git-blame.nvim'

call plug#end()

