set nocompatible              " required
filetype off                  " required
set nu
set ic
set cursorline
set splitbelow
set splitright
set showmatch
set clipboard=unnamed
set undofile
"set undolevels=1000         " How many undos
"set undoreload=10000        " number of lines to save for undo
set backup                        " enable backups
set swapfile                      " enable swaps
set undodir=~/.vim/temp/undo     " undo files
set backupdir=~/.vim/temp/backup " backups
set directory=~/.vim/temp/swap   " swap files

" Make those folders automatically if they don't already exist.
"if !isdirectory(expand(&undodir))
"    call mkdir(expand(&undodir), "p")
"endif
"if !isdirectory(expand(&backupdir))
"    call mkdir(expand(&backupdir), "p")
"endif
"if !isdirectory(expand(&directory))
"    call mkdir(expand(&directory), "p")
"endif
"setting swap file to other directory
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap <C-J> <C-W><C-J>
inoremap <C-K> <C-W><C-K>

"go also to visually wrapped lines
nnoremap j gj
nnoremap k gk
"enable the 256-color mode for Vim.
set t_Co=256
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
"Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tomasiser/vim-code-dark'
Plugin 'mbbill/undotree'
Plugin 'dense-analysis/ale'
Plugin 'hashivim/vim-terraform'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" exit insert mode with 
inoremap jj <ESC>

set encoding=utf-8


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	autocmd!
autocmd BufNewFile *dag.py 0r ~/.vim/templates/template_dag.py
autocmd FileType text setlocal spell
autocmd FileType text setlocal nonu
augroup END


"mapping the leader to ,
:let mapleader = ","

" Apply YCM FixIt
:nnoremap <leader>fi :YcmCompleter FixIt<CR>

"increaser preview height
:set previewheight=20

"this is to add double quotes to a word
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
"this is to add sigle quotes to a word
:nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"this adds double quotes to a visualy selected text
:vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>l

"this ads single quotes to a visualy selected text
:vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>l

let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"dupa"
"map leader + y to copy text into clipboard
vnoremap <leader>y "+y

"map leader + p to paste from clipboard
inoremap <leader>p <ESC>"+pa
vnoremap <leader>p "+p<ESC>
nnoremap <leader>p "+p

"map leader u to undotree
nnoremap <leader>u :UndotreeToggle<CR>

"edit quickly the vimrc file
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"fuGITive shortcuts
:nnoremap <leader>gd :Gvdiffsplit<cr>

"Terraform format shortcut
:nnoremap <leader>tf :TerraformFmt<cr>

"map space to highlight the whole word
nnoremap <space> viw

"map - to move one line down
:nnoremap - ddp

"map _ to move one line up
:nnoremap _ ddkP

"map H to go to the beginning of the line first word
:nnoremap H ^

"map L to go to the end of the line
:nnoremap L $



" highlight last inserted text
nnoremap gV `[v`]

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

augroup html_comment
	autocmd!
:autocmd FileType html vnoremap <buffer> # <ESC>`<0i<!--<ESC>`>A--><ESC>
:autocmd FileType html vnoremap <buffer> ( <ESC>`<0xxxx`>$xxx
"comment a block of code
:autocmd FileType python :vnoremap <buffer> <silent># :s/^/#/<cr>:noh<cr>
:autocmd FileType python :vnoremap <buffer> <silent>( :s/^#//<cr>:noh<cr>
augroup END

"put a word into a quotes
vnoremap ' <ESC>bi'<ESC>ea'<ESC>

"comment inside html

"duplicate the line
nnoremap yy o<esc>k

"assign a new movement parameter p i(
:onoremap p i(

"assign a new movement for the body of function
:onoremap b /return<cr>

"assign new movement to delete all withing parentheses and go inside in insert
"mode
:onoremap in( :<c-u>normal! f(vi(<cr>
:onoremap in{ :<c-u>normal! f{vi{<cr>

"assigne new movement to delete everything what's inside last parentheses:
:onoremap il( :<c-u>normal! F)vi(<cr>
:onoremap il{ :<c-u>normal! F}vi{<cr>


set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"this is to move to tabs quickly
nnoremap <leader>k :tabr<cr>
nnoremap <leader>j :tabl<cr>
nnoremap <leader>h :tabp<cr>
nnoremap <leader>l :tabn<cr>

"this is to navigate buffers:
nnoremap <leader>f :bn<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR>
nnoremap <leader>5 :5b<CR>

:hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
:hi TabLine ctermfg=Blue ctermbg=Yellow
:hi TabLineSel ctermfg=Red ctermbg=Yellow

"tabcompletion search down in subfolders
set path+=**

"display all matching files when we tab complete
set wildmenu

let python_highlight_all=1
syntax on

colorscheme codedark

"NERDTree setup
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"NERDTree group
augroup nerdtreegroup
autocmd!
	
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
augroup END

"if has ('autocmd') " Remain compatible with earlier versions
" augroup vimrc     " Source vim configuration upon save
"    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
"    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
"  augroup END
"endif " has autocmd

"source the vim file
:nnoremap <leader>r :source $MYVIMRC<cr>

"ALE linter setup:
let g:ale_linters = {'python': 'all'}
let g:ale_fixers = {'python': ['isort', 'yapf', 'remove_trailing_lines', 'trim_whitespace']}
let g:ale_lsp_suggestions = 1
let g:ale_fix_on_save = 1
let g:ale_go_gofmt_options = '-s'
let g:ale_go_gometalinter_options = '— enable=gosimple — enable=staticcheck'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
