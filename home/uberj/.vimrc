" Guides
" * http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
" * http://oli.me.uk/2015/06/17/wrangling-javascript-with-vim/
" Vundle settings
" ===============
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"  lean & mean status/tabline for vim that's light as air (https://github.com/vim-airline/vim-airline)
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlp.vim'
Plugin 'Buffergator'
Plugin 'fugitive.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'Puppet-Syntax-Highlighting'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'mileszs/ack.vim'
Plugin 'mhinz/vim-signify'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Raimondi/delimitMate'
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Indentation Constants.
" ======================
" Language specific stuff should go in  ~/.vim/after/ftplugin/<language>.vim
" use spaces
set expandtab
set autoindent

" Set leader to something awesome
let mapleader = "\<Space>"

" Ctrl-C after "{}" does an open of the statement
imap <C-c> <CR><Esc>O

" Reload vimrc
" ============
nmap <leader>rv :so ~/.vimrc<cr>

" Ctrl P
" ======
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Buffer Movements
" ================
" nmap: normal map
nmap <leader>c :bdelete<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<cr>
nmap <leader>bl :BuffergatorOpen<cr>

" Go to the previos buffer and then delete the 'alternate file'
nmap <silent> <leader>d :bp\|bd #<cr>

" Tab Movements
" =============
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Git Helpers
" ==========
nmap <leader>gd :!git diff<CR><CR>

" Airline settings
" ================
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Json Plugin
" ===========
let g:vim_json_syntax_conceal = 0  " Its super annoying to have the quotes go away

" Ctrl P
" ======
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*

" vim-javascript
" ==============
let g:javascript_plugin_jsdoc = 1

" Syntastic
" =========
let g:syntastic_check_on_open=1

"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Ack
" ===
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" JSX
" ===
let g:jsx_ext_required = 0

" Solarized
" =========
syntax enable
set background=dark
colorscheme solarized

" Persistent undo
" ===============
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" Python settings
" ===============
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
