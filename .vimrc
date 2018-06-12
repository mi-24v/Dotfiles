"enable multibyte chars in vimscripts(e.g.vimrc)
scriptencoding utf-8

"if vim-plug is not installed, install it.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"plugin install
call plug#begin('~/.vim/plugged')
"help itself
Plug 'junegunn/vim-plug'
"material theme
Plug 'skielbasa/vim-material-monokai'
"highlight some space
Plug 'bronson/vim-trailing-whitespace'
"enhance status line
Plug 'itchyny/lightline.vim'
"fzf (only enabled in vim)
Plug 'junegunn/fzf', { 'dir': '~/.vim/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"outlining (requires fzf and ctags binary)
Plug 'theoldmoon0602/fzf_outline.vim'
call plug#end()

"FIXME don't work
"plugin check function
let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

"use like this
"if s:plug.is_installed("vim-myplugin")
"  " setting
"endif

if s:plug.is_installed("vim-material-monokai")
	set background=dark
	set termguicolors
	colorscheme material-monokai
endif

"if that above function work correctly, delete this.
set background=dark
set termguicolors

"settings

"set title to terminal
set title
"set line number
set number
"show status line always
set laststatus=2
"show current mode
set showmode
"show commands
set showcmd
"show current cursor position
set ruler

"indents
"disable soft tab(replacing tab to space)
set noexpandtab
"tab size setting
set tabstop=4
set shiftwidth=4
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
"auto indent (e.g.new line)
set smartindent
set autoindent

"chars setting

"visualize space chars
set list
set listchars=tab:»-,trail:-,eol:+,extends:»,precedes:«,nbsp:%
"encoding settings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932
"line separators
set fileformats=unix,dos,mac
"avoid clashing chars(e.g.□)
set ambiwidth=double

"cursor settings

"enable cursor moving some place
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"search settings

"searchs per 1 char inputs
set incsearch
"ignore whether upletters and lowletters
set ignorecase
"but if query has upletters, search upletters.
set smartcase
"highlighting results
set hlsearch
"一番上まで戻る
set wrapscan

