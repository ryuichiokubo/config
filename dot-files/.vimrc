" *** Vundle setup start ***

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
"set rtp+=~/.vim/bundle/vundle/
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

"行の折り返しをしている時に見た目の次の行へ移動する FIXME
nnoremap j gj
nnoremap k gk

inoremap <C-e> <End>
inoremap <C-a> <HOME>

"File search
noremap <C-p> :FufFile **/<CR>

"Map for frequently used code snipet
inoremap <C-l> console.log("@@@@@@@@ ")

"autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"shortcut for console log
command -nargs=1 Console :normal iconsole.log("@@@@@@@@ <args>: ", <args>)

