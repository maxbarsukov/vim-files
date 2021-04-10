" Mappings

nnoremap <leader>ww <C-W>w
nnoremap <leader>qq <C-W>q

nnoremap <leader>wq :wq<CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Ranger
" open current file by default
nnoremap <C-r> :RangerNewTab<CR>
" Default Ranger behaviour
nnoremap <C-r>f :RangerCurrentFile<CR>
nnoremap <C-r>d :RangerCurrentDirectory<CR>
nnoremap <C-r>w :RangerWorkingDirectory<CR>


nnoremap <S-h> :call ToggleHiddenAll()<CR>

nmap <F9> :TagbarToggle<CR>

nmap <ESC>t :hi Normal guibg=NONE ctermbg=NONE<CR>

map <F7> :setlocal spell! spelllang=en,ru<CR>

map <Space> <Leader>
" let mapleader=","
nnoremap <silent> <C-f> :FZF<CR>

map <F3> :terminal<CR>
map <F2> :vertical terminal<CR>
tmap <F2> exit<CR>

map <F4> :QuickRun<CR>

vmap <TAB> >gv
vmap <S-TAB> <gv

inoremap kj <Esc>
inoremap jj <Esc>
inoremap jk <Esc>

nnoremap xx a
nnoremap xc a
nnoremap cx a

inoremap zz <Esc>:
nnoremap zz <Esc>:

nnoremap <silent> <leader><Left> :vertical resize +5<CR>
nnoremap <silent> <leader><Right> :vertical resize -5<CR>
nnoremap <silent> <leader><Down> :resize -5 <CR>
nnoremap <silent> <leader><Up> :resize +5 <CR>

nnoremap `j <C-W>j
nnoremap `k <C-W>k
nnoremap `h <C-W>h
nnoremap `l <C-W>l
nnoremap `q <C-W>q
nnoremap `w <C-W>w
" nnoremap `a <C-W>Q
nnoremap `v <C-W>v
nnoremap `s <C-W>s

map <leader>\ :Explore<CR>

nnoremap <leader>tn     :tabnew<CR>
inoremap <leader>tn     <Esc>:tabnew<CR>

nnoremap <leader>tc     :tabclose<CR>
inoremap <leader>tc     <Esc>:tabclose<CR>

nnoremap <leader>t     :tabnext<CR>
inoremap <leader>t     <Esc>:tabnext<CR>

nnoremap <leader>T     :tabprevious<CR>
inoremap <leader>T     <Esc>:tabprevious<CR>

cmap install PlugInstall

cmap Wq wq
cmap WQ wq
cmap qw wq
cmap Qw wq
cmap QW wq

cmap W w

cmap rv rightb vsp
cmap lv lefta vsp


" NERDTree
map <F5> :NERDTreeToggle<CR>
nmap <F5> :NERDTreeToggle<CR>

" System buffer commands
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

map       gm           :call cursor(0, virtcol('$')/2)<CR>

" Browsers
nnoremap  <F12>f       :exe ':silent !firefox %'<CR><C-l>
nnoremap  <F12>c       :exe ':silent !chromium-browser %'<CR><C-l>

nnoremap  ""            viw<esc>a"<esc>hbi"<esc>lel

nnoremap  ''            viw<esc>a'<esc>hbi'<esc>lel


" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" nnoremap H gT
" nnoremap L gt

" <ctrl-l> toggle between 2 most recent tabs;
" <ctrl-j/k> goto the last/next tab;
" <ctrl-t> open a new tab.
"
" tab navigation: Alt or Ctrl+Shift may not work in terminal:
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" Tab navigation like Firefox: only 'open new tab' works in terminal
" move to the previous/next tabpage.
nnoremap <C-j> gT
nnoremap <C-k> gt
" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <C-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <C-l> :exe "tabn ".g:lasttab<cr>

nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error


noremap  <F8>   :Autoformat<CR><CR>
vnoremap <C-F8> gq

nmap <silent> [s <Plug>(ale_previous_wrap)
nmap <silent> ]s <Plug>(ale_next_wrap)
nmap <F6> <Plug>(ale_fix)


nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <F1> :call investigate#Investigate()<CR>


nmap <C-q> :IndentLinesToggle<CR>


au FileType html,css,sass,scss,less imap <expr><F4> emmet#expandAbbrIntelligent("\<tab>")
au FileType html,css,sass,scss,less imap <expr>jk   emmet#expandAbbrIntelligent("\<tab>")
au FileType html                    imap <C-\>      <CR><CR><Esc>ki<Tab>

map <leader>g :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" COC.NVIM

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


