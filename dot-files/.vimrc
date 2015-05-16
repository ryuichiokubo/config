" *** Vundle setup start ***

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'tpope/vim-rails.git'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
"" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" ...

Plugin 'scrooloose/syntastic.git'
Plugin 'gioele/vim-autoswap.git'
Plugin 'mru.vim'

Plugin 'itchyny/calendar.vim'
let g:calendar_google_calendar = 1

Plugin 'fugitive.vim'
""set statusline+=%{fugitive#statusline()}

Bundle 'ntpeters/vim-better-whitespace'

Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'

syntax enable

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line
"
" *** Vundle setup end ***

colorscheme koehler 

" 全モードでマウスを有効化
set mouse=a
" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell
" そしてビジュアルベルも無効化する
set t_vb=
" タイプ途中のコマンドを画面最下行に表示
set showcmd
" コマンドライン補完を便利に
set wildmenu
"always show statusline
set laststatus=2
"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backup
set backupdir=$HOME/vimbackup/backup "mkdir if not there
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup/swap "mkdir if not there
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
" highlight search
set hlsearch
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字小文字を無視する
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
"set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"Replace tab with spaces
set expandtab
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

set ruler
"set spell
set splitright
set autoread

"prevent error crontab: temp file must be edited in place
set backupskip=/tmp/*,/private/tmp/*

"行の折り返しをしている時に見た目の次の行へ移動する FIXME
nnoremap j gj
nnoremap k gk

inoremap <C-e> <End>
inoremap <C-a> <HOME>

"File search
"call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns',
"['**/*.coffee', '**/*.js']]) # FIXME
noremap <C-p> :FufFile **/<CR>
noremap <C-o> :FufBuffer<CR>

"shortcut for console log # XXX
command! -nargs=1 Console :normal iconsole.log("@@@@@@@@ <args>: ", <args>)

"quickly edit vimrc and update
let mapleader = "_"
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>:echo "vimrc reloaded"<cr>

"set all window sizes equal
nnoremap <leader>eq :set equalalways! equalalways!<cr>
"autocmd FocusGained * <leader>eq<cr> "FIXME

"indent xml
nnoremap <leader>xf :%s/></>\r</g \| filetype indent on \| setf xml \| normal gg=G<cr>

"disable arrow keys in insert mode (use normal mode to move around)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"escape easily
inoremap jk <esc>
inoremap <esc> <nop>

"open notes directory
nnoremap <leader>note :tabe ~/projects/Notebook/notes<cr>

"autocompletion
augroup completion
  autocmd!
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END

"shortcut for comments
augroup shortcut_comment
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
  autocmd FileType php nnoremap <buffer> <leader>c I//<esc>
  autocmd FileType coffee nnoremap <buffer> <leader>c I#<esc>
augroup END

"shortcut for function
augroup shortcut_function
  autocmd!
  autocmd FileType javascript :iabbrev <buffer> func function() {}<left>
augroup END

"shortcut for logging
augroup shortcut_logging
  autocmd!
  autocmd FileType javascript :iabbrev <buffer> cons console.log("@@@@@@@ ")<left>
  autocmd FileType coffee :iabbrev <buffer> cons console.log "@@@@@@@ "<left>
augroup END

"inside next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>

