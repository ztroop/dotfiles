" **************************
" Settings
" **************************

set encoding=utf-8
set guifont=FiraCode\ Nerd\ Font,DejaVuSans:h18

set tabstop=4
set shiftwidth=4
set expandtab

set lazyredraw
set laststatus=2

set relativenumber
set number
set invlist
set backspace=2
set showcmd
set mouse=a
set nowrap

set clipboard=unnamedplus

filetype plugin indent on

set autoindent
set scrolloff=2
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" **************************
" Plug System
" **************************

if has('vim_starting')
  set nocompatible
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript,python,rust"
let g:vim_bootstrap_editor = "nvim"

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))

" **************************
" Plug Packages
" **************************

Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'

" Language Plugs

Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'davidhalter/jedi-vim'

" **************************

if filereadable(expand("~/.config/nvimrc.local.bundles"))
  source ~/.config/nvimrc.local.bundles
endif

call plug#end()

" **************************
" Plugs Configuration
" **************************

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:vimspector_enable_mappings = 'HUMAN'
" For normal mode, the word under the cursor.
nmap <Leader>di <Plug>VimspectorBalloonEval
" For visual mode, the visually selected text.
xmap <Leader>di <Plug>VimspectorBalloonEval

let g:rainbow_active = 1
let g:dracula_colorterm = 1

" **************************
" Settings - Continued
" **************************

syntax on

tnoremap jj <C-\><C-n>

set termguicolors

color dracula
