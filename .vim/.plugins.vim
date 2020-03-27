" ===========================================================
" # vim-plug
" ===========================================================
" vim-plugによるplugin管理/使い方
" :PlugInstall ([name ...] )    Install plugins
" :PlugUpdate ([name ...])      Install or update plugins
" :PlugStatus                   Check the status of plugins
" :PlugUpgrade                  Upgrade vim-plug itself
" :PlugClean[!]                 Remove unlisted plugins

call plug#begin('~/.vim/plugged')

" Homebrewで入れたfzfをvimから使えるようにする
    Plug '/usr/local/opt/fzf'
" fzf連携ファイルあいまい検索 :[fzf]f, :[fzf]rなど
    Plug 'junegunn/fzf.vim'
" ripgrep連携超高速検索 :Rg をvimから使えるようにする
    Plug 'jremmen/vim-ripgrep'
" シンプルなステータスライン	jellybeans"
    Plug 'itchyny/lightline.vim'
" コードやディレクトリ等にアイコンフォントを使用
    Plug 'ryanoasis/vim-devicons'
" サイドバーにディレクトリツリーを一覧表示 <C-e>
    Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle'] }
" タブ使用時にもNERDTree
    Plug 'jistr/vim-nerdtree-tabs'
" コードを簡単に整形する。ヴィジュアルモードで使うといい
    Plug 'junegunn/vim-easy-align', { 'on': ['EasyAlign'] }
" 構文エラーチェック
    Plug 'vim-syntastic/syntastic'
" コマンドタブ補完"
    Plug 'ervandew/supertab'
" Colors
    Plug 'morhetz/gruvbox'
    Plug 'sickill/vim-monokai'
    Plug 'jnurmine/Zenburn'
    Plug 'tomasr/molokai'
    Plug 'w0ng/vim-hybrid'
    Plug 'ayu-theme/ayu-vim'
" ヘルプ日本語化(わかりやすい)
    Plug 'vim-jp/vimdoc-ja'
" Vim から Git を操作 たぶん使わないんだけどlightlineの設定に入ってたのでうっかり入れた。
    Plug 'tpope/vim-fugitive'

call plug#end()

" ===========================================================
" # Vim-plugins settings
" ===========================================================

" ================ fzf.vim ================
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" ripgrepをvimgrepに代わりデフォルトに。:Rgまたはrgが使える
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
command! -nargs=* -complete=file Rg :tabnew | :silent grep --sort-files <args>
command! -nargs=* -complete=file Rgg :tabnew | :silent grep <args>

" ripgrepで検索中、?を押すとプレビュー:
command! -bang -nargs=* Ripgrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Files、GFilesコマンドにもプレビューを出す
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" 最近使ったファイルMost Recently Usedを設定/プレビューも出す
command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })
command! -bang -nargs=? -complete=dir FZFMru
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

" Colorsの表示を見やすくする(カラースキームを一時的に変えられる)
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" ---------- mapping selecting mappings
" 挿入モードの時の補完 fzf-complete-wordはcat/
"    単語補完
"    dirのパス補完
"    ファイル名補完
"    全てのバッファを対象に行を検索して補完
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)

"'<leader><tab>'でmap表示。<leader>は<space>
let g:mapleader = "\<space>"
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

"'<Leader>f'が[Fzf]なので'<Leader>f f'がファイル検索。
nmap <leader>f [Fzf]
nnoremap [Fzf] <Nop>
nnoremap [Fzf]f :<C-u>Files<CR>
nnoremap [Fzf]g :<C-u>GFiles<CR>
nnoremap [Fzf]G :<C-u>GFiles?<CR>
nnoremap [Fzf]b :<C-u>Buffers<CR>
nnoremap [Fzf]h :<C-u>History<CR>
nnoremap [Fzf]co :<C-u>Colors<CR>
nnoremap [Fzf]r :FZFMru<CR>

" ================ lightline.vim/statusline ================
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [ [ 'mode', '' ],
            \             [ 'fugitive', 'filename' ] ],
            \   'right': [ [ 'syntastic', 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_expand': {
            \   'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \   'syntastic': 'error',
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename',
            \   'filetype': 'LightLineFiletype',
            \   'fileformat': 'LightLineFileformat',
            \   'fileencoding': 'LightlineFileencoding',
            \   'mode': 'LightlineMode',
            \ },
            \ }

let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ''._ : ''
    else
    return ''
    endif
endfunction


function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" ================ vim-devicons ================
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" ================ NERDTree ================
" <C-e>でNERDTreeを表示
map <silent><C-e> :NERDTreeToggle<CR>
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
autocmd StdinReadPre * let s:std_in=1
" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1
"NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
" 拡張子のHighlight設定
 function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" ディレクトリ表示記号を変更する
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30

" ================ NERDTree-tabs ================
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" ================ Syntastic ================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
"構文エラーリストを非表示0
let g:syntastic_auto_loc_list = 0
"ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
"`:wq` で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1
"構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
  \ 'ruby', 'javascript','coffee', 'scss', 'html', 'haml', 'slim', 'sh',
  \ 'spec', 'vim', 'zsh', 'sass', 'eruby'] }

" ================ vim-easy-align ================
" interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ================ vim-help ================
"コマンドh(help)で起動。一画面にしたいときは
"h help |only<Enter>
set helplang=ja,en

" ================ fugitive.vim ================
nnoremap <silent> ,dg :diffget<CR>
nnoremap <silent> ,dp :diffput<CR>

autocmd User fugitive
  \ if get(b:, 'fugitive_type', '') =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete
