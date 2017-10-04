set nocompatible "We want the latest Vim settings/options.
so ~/.vim/plugins.vim
syntax enable
set backspace=indent,eol,start	"Make backspace behave like every other editor. 
let mapleader=','		"The default leader is \, but a comma is much better.
set number			"Let's activate line numbers.

"-----These two lines enable native ctags autocompletion support built in
"VIM-----"
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"-----Split Management-----"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>



"-----Visuals-----"

colorscheme atom_dark_256	"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h17
set macligatures
set guioptions-=e 		"We don't want GUI tabs
set linespace=15		"Macvim-specific line-height
"/ From Jeffrey Way vimrc 
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
set showcmd
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


"/end Jeffrey


set guioptions-=l		"Disable gui scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=R

"-----Search-----"
set hlsearch
set incsearch


"=-----Mappings-----"

"Make it easy to edit Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
"Make NERDTree easier to toggle.
nmap <C-K><C-B> :NERDTreeToggle<cr>
"Open Google chrome
nmap ,c :!open -a Google\ Chrome<cr>
"Find tag
nmap <Leader>f :tag<space>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

"-----Ctags nice to have shortcuts-----

"Ctrl-\  opens the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"D-] opens the definition in a vertical split
"Change to Alt with A-] on Linux, Windows
map <D-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"D-[ scan for all occurences with the name selected
"Change to Alt with A-] on Linux, Windows
map <D-[> :exec("tselect ".expand("<cword>"))<CR>

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

"-----Plugins-----"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order,:ttb,min:1,max:30,results:30'
nmap <C-P> :CtrlP<cr>
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>
"/
"/ Javascript
"/
let g:javascript_plugin_flow = 0
let g:jsx_ext_required = 0

"/
"/ w0rp/Ale
"/

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_fixers = {'javascript': ['eslint']}

let g:ale_sign_column_always = 1
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
  \   'java': ['javac'],    
  \   'javascript': ['eslint', 'standard'],
  \   'python': ['flake8'],
  \   'php': ['php'],
  \   'css': ['stylelint'],
  \   'sass': ['stylelint']
  \ }
let g:ale_javascript_eslint_executable = 'eslint'
let g:ale_javascript_eslint_use_global = 1

"-----Ale config for Java-----

if isdirectory('lib') != 0
    let s:path=expand("./lib/*.jar")
else
    let s:path=expand("./*.jar")
endif
if s:path == "./lib/*.jar"
    let s:path=''
else
    let s:classpath=substitute(s:path,'\n',':','g')
    let s:fixclasspath=$CLASSPATH . ':' . s:classpath
    let g:JavaComplete_LibsPath=s:fixclasspath
    " ale java
    let g:ale_java_javac_classpath=s:fixclasspath
endif

"-----End Ale config-----




" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1


"-----Auto-Commands-----"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"!ctags -R              regenerate tags
":tn                    next tag
":tp                    previous tag
":ts                    select amongst all of the tags available
"gt                     switch amongst tabs
"gg			goes at the beginning of the file
"zz			center lines in the middle of the screen
":$			goes to the end of the file
"Shift+$		goes to the end  a line
"Shift+^		goes to the beginning of a line
"<Leader>j      import components from node_modules with import-js

