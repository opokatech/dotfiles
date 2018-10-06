" First steps:
"
" 1. install vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" 2. in vim: PluginInstall. It will fetch all of them and configure. Configuration of YouCompleteMe will fail (needs to
" be compiled), so..
"
" 3. configure YouCompleteMe
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer --js-completer


" Setting up vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" My standard config is below
syntax on

set expandtab
set incsearch
set number
set showcmd
set ignorecase
set shiftwidth=4
set tabstop=4
set textwidth=120
set novisualbell

set fileencodings=ucs-bom,utf8
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

if has('gui_running')
    set guifont=Monospace\ 12
    set columns=140
    set lines=180
endif

" Moving between files
map <F3> =<ESC>:previous<CR>
map <F4> =<ESC>:next<CR>

" Moving between errors/warnings after calling make from vim (not !make, but make)
map <F5> =<ESC>:cprevious<CR>
map <F6> =<ESC>:cnext<CR>

" Moving between found tags
map <F7> =<ESC>:tprevious<CR>
map <F8> =<ESC>:tnext<CR>

" For easy copying with mouse
set pastetoggle=<F9>

" Applying YouCompleteMe FixIt
map <F12> :YcmCompleter FixIt<CR>
map <S-F12> :%s/\s\+$//e<CR>

" For some files remove trailing space at save
autocmd FileType python,css,less,sass,javascript,c,tex autocmd BufWritePre <buffer> :%s/\s\+$//e

" Use english spelling for latex
autocmd FileType tex set spelllang=en_gb spell

" This is less file.
autocmd BufNewFile,BufRead *.less set filetype=less

" Ino files are in c or cpp.
autocmd BufNewFile,BufRead *.ino set filetype=cpp

" Special tabstop and shiftwidth for some files
autocmd FileType javascript,php,html,htmldjango,css,scss setlocal tabstop=2 shiftwidth=2

" In make we use real tabs
autocmd FileType make set noexpandtab

" Json -> javascript
autocmd BufNewFile,BufRead *.json set ft=javascript
" vim-javascript config
let g:javascript_plugin_jsdoc = 1

" YouCompleteMe options 
let g:ycm_autoclose_preview_window_after_completion = 1

" clang-format bindings
" map <C-I> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
" imap <C-I> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>

" For matching html tags with %
packadd! matchit
