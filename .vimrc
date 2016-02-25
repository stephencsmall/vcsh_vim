" enable pathogen
execute pathogen#infect()

set fileencoding=utf-8

set backspace=indent,eol,start

colorscheme molokai

set shell=/bin/sh

" enable syntax highlighting
syntax on

set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h11

let g:pymode_lint_options_pep8 = {'ignore': 'E501'}

" easier window nav
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" Tagbar toggle
"nmap <Leader>m :TagbarToggle<CR>

nmap <Leader>u :UndotreeToggle<CR>
" enable indentation plugin
filetype on
filetype plugin indent on

let g:airline_theme = 'molokai'
let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
let g:airline_powerline_fonts = 1 " dat powerline font jumble...
let g:airline#extensions#tmuxline#enabled = 1 " keep me from fucking up tmuxline
let g:airline#extensions#tabline#enabled = 1 " Enable the sweet tabline
let g:airline#extensions#tabline#show_tab_type = 1 " show buffer type in tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1 " show buffer index in tabline
let g:airline#extensions#tabline#tab_nr_type = 1     " Show buffer #, not # of splits
let g:airline#extensions#tabline#show_tab_nr = 1     " Show buffer # in tabline

" Mappings for buffer/tabline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" Promptline specifications
let g:promptline_theme = 'airline'
let g:promptline_preset = {
	\'b'    : [ '$USER' ],
	\'c'    : [ promptline#slices#cwd({ 'dir_limit': 2 }) ],
	\'warn' : [ promptline#slices#last_exit_code() ],
	\'y'	: [ promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)' ],
	\'x'	: [ promptline#slices#git_status() ],
	\'z'	: [ '%m']}

" Tmuxline specifications
let g:tmuxline_preset = {
	\'a'    : '#S',
	\'b'    : '#(whoami)',
	\'c'    : ['#W'],
	\'win'  : ['#I', '#W'],
	\'cwin' : ['#I', '#W'],
	\'x'    : '%a',
	\'y'    :  '%R',
	\'z'    : '#h'}

" Indentation guide customization
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" line numbers
set number

" set leader key to comma
let mapleader=","

" Enable statusline
set laststatus=2

" use spaces for tabs and remove tabs when writing
" http://stackoverflow.com/questions/2158305/is-it-possible-to-display-indentation-guides-in-vim/2159997#2159997
"
" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
" autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
"autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
"autocmd! bufwritepost * set noexpandtab | retab! 4

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set term=screen-256color

map <Leader>n <plug>NERDTreeTabsToggle<CR>

autocmd BufRead,BufNewFile *.md setlocal textwidth=80

let g:pymode_syntax = 1
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1

let g:pandoc_syntax_conceal_use = 0
