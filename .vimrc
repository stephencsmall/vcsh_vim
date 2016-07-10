" Plugin injection & Bootstrapping
" ==============================================================================

" enable pathogen
execute pathogen#infect()

" Colors & Theme
" ==============================================================================

" set up fonts for the GUI
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h12

" set tomorrow colorscheme
colorscheme Tomorrow-Night-Bright

" Airline settings
let g:airline_theme = 'tomorrow'
let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh.vim"
let g:airline_powerline_fonts = 1                                               " Enable patched powerline font characters
let g:airline#extensions#tmuxline#enabled = 0                                   " Disable tmuxline and rely on the snapshot file
let g:airline#extensions#tabline#enabled = 1                                    " Enable the tabline when working with tabs
let g:airline#extensions#tabline#show_tab_type = 1                              " show buffer type in tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1                            " show buffer index in tabline
let g:airline#extensions#tabline#tab_nr_type = 1                                " Show buffer #, not # of splits
let g:airline#extensions#tabline#show_tab_nr = 1                                " Show buffer # in tabline

" Promptline Settings
let g:promptline_theme = 'airline'
let g:promptline_preset = {
    \'b'    : [ '$USER' ],
    \'c'    : [ promptline#slices#cwd({ 'dir_limit': 2 }) ],
    \'warn' : [ promptline#slices#last_exit_code() ],
    \'y'    : [ promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)' ],
    \'x'    : [ promptline#slices#git_status() ],
    \'z'    : [ '%m']}

" Tmuxline Settings
let g:tmuxline_preset = {
    \'a'    : '#S',
    \'b'    : '#(whoami)',
    \'c'    : ['#W'],
    \'win'  : ['#I', '#W'],
    \'cwin' : ['#I'],
    \'x'    : '%a',
    \'y'    :  '%R',
    \'z'    : '#h'}

" Enable statusline
set laststatus=2

set display=lastline

" File Encoding & System (shell) settings
" ================================================================================

set fileencoding=utf-8

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd BufRead,BufNewFile *.md setlocal textwidth=80

set shell=/bin/sh

" Syntax, folding, and indenting
" ================================================================================

" enable syntax highlighting
syntax on
set foldmethod=syntax
set foldlevelstart=1
let g:pandoc_syntax_conceal_use = 0

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" enable indentation plugin
filetype on
filetype plugin indent on
set backspace=indent,eol,start

" Indentation guide customization
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" line numbers
set number

" use spaces for tabs and remove tabs when writing
" http://stackoverflow.com/questions/2158305/is-it-possible-to-display-indentation-guides-in-vim/2159997#2159997
"
" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

" Pymode settings
let g:pymode_syntax = 1
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1
"let g:pymode_lint_options_pep8 = {'ignore': 'E501'}


" Keybindings and navigation 
" ===================================================================================

" set leader key to comma
let mapleader=","

" easier window nav
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" Tagbar toggle
nmap <Leader>m :TagbarToggle<CR>

" Nerdtree toggle
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Undotree toggle
nmap <Leader>u :UndotreeToggle<CR>

" Geeknote toggle
noremap <Leader>g :Geeknote<cr>
