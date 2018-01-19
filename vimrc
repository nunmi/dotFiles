set nocp                                                         " must be first line
let mapleader = ','

set backspace=indent,eol,start                                   " backspace 
set mouse=a                                                      " automatically enable mouse usage
set noautoindent
set clipboard+=unnamed                                           " Yanks go on clipboard instead.
set nobackup                                            
set incsearch                                                    " find as you type search
set shiftwidth=3                                                 " use indents of 3 spaces
set expandtab                                                    " tabs are spaces, not tabs
set tabstop=3                                                    " an indentation every 3 columns
set softtabstop=3                                                " let backspace delete indent
set showmatch                                                    " show matching brackets/parenthesis
set nu                                                           " Line numbers on
set showmode                                                     " display the current mode
set linespace=0                                                  " No extra spaces between rows
set winminheight=0                                               " windows can be 0 line high 
set ignorecase                                                   " case insensitive search
set smartcase                                                    " case sensitive when uc present
set cursorline                                                   " highlight current line
set pastetoggle=<F12>                                            " pastetoggle (sane indentation on paste)
set virtualedit=onemore                                          " allow for cursor beyond last character

syntax on                                                        " syntax highlighting
set hlsearch                                                     " highlight search terms
set nowrap                                                       " wrap long lines

"indentation
set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

"Obvious mode
set laststatus=2

"ruler for command line
if has('cmdline_info')
set ruler                                                        " show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)               " a ruler on steroids
set showcmd                                                      " show partial commands in status line and " selected characters/lines in visual mode
endif


"Backup Directories
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
"set undodir=~/.vim/undo_files//

"Toggle line number
nnoremap <F2> :set nonumber!<CR>

"Easy tab movement
map <S-Right> <ESC>:tabnext<CR>
map <S-Left> <ESC>:tabprev<CR>
map <leader>t <Esc>:tabnew<CR>

"set the font and the shell for windows 
if has("gui_running")
  if has("gui_win32")
    set guifont=Consolas:h11:cANSI
    set shell=C:/cygwin/bin/bash
    set shellcmdflag=--login\ -c
    set shellxquote=\"
 else
    set guifont=Monospace\ 12 
  endif
endif

"setting the column 80, 90
if exists('+colorcolumn')
  nmap <C-l> :set colorcolumn=80,90<CR>
  nmap <C-r><C-l> :set colorcolumn=0<CR>
  hi ColorColumn guibg=#2d2d2d ctermbg=246
endif

"copy paste to the system clipboard
map <leader>sc "+y<CR>
map <leader>sp "+gP<CR>
map <leader>sx "+x<CR>

" Use CTRL-S for saving
noremap <C-S>      :update<CR>

"***********************************************************************************
"plugins 
"install ctags, cscope and astyle
"***********************************************************************************


"vundle settings
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"NerdTree 
Plugin 'scrooloose/nerdtree'
map <leader>nt :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr' , '\.o$']
let NERDTreeChDirMode=0
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeKeepTreeInNewTab=1


"NERDCommenter
"<,><c><space>  
Plugin 'scrooloose/nerdcommenter'


"tagbar
Plugin 'majutsushi/tagbar'
nmap <leader>tl :TagbarToggle<CR>


"Ctrl-P
Plugin 'kien/ctrlp.vim'
set wildignore+=*.so,*.o,*.swp,*.zip

"snipmate
"Plugin 'gmarik/snipmate.vim'

"powerline
Plugin 'Lokaltog/vim-powerline'


"Fugitive
Plugin 'tpope/vim-fugitive'


"ack.vim
Plugin 'mileszs/ack.vim'
"nnoremap <leader>a :Ack!<space>

"a.vim
Plugin 'vim-scripts/a.vim'
nnoremap <leader>at :AT<CR><CR>


"surround
Plugin 'tpope/vim-surround'

"youcompleteme
"Plugin 'Valloric/YouCompleteMe'

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_conf.py'
let g:Show_diagnostics_ui=0
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0

"colorscheme
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/base16-vim'
Plugin 'endel/vim-github-colorscheme'

"set the color scheme
set t_Co=256
"if match($TERMCAP, 'Co#256:') == 0 || match($TERMCAP, ':Co#256:') > 0           
    "set t_Co=256                                                                
"endif   


"set background=dark                                  
"colorscheme monokai-soda

set background=dark                                  
colorscheme solarized

"if has('gui_running')
   ""set background=dark                                  
   "colors monokai-soda
"else
   ""set background=dark                                  
   "colors monokai-soda
"endif


" cscope 
if has("cscope")
   set cscopetag
   set csto=0
   set nocscopeverbose

" add any cscope database in current directory
   if filereadable("cscope.out")
       cs add cscope.out
" else add the database pointed to by environment variable
   elseif $CSCOPE_DB != ""
       cs add $CSCOPE_DB
   endif


   "find all references"
   nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   "find global definitions"
   nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   "find functions calling this function"
   nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   "find assignments"
   nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   "egrep"
   nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
   "open filename"
   nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
   "find files that include the filename"
   nmap <C-[>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   "find functions called by this function"
   nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif

  nmap <leader>ccs :!(cd %:p:h;find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files;cscope -b -i cscope.files -f cscope.out)<CR>
  \:cs reset<CR>
  
    
"ctags
"map <leader>cct :!(cd %:p:h;ctags -R .)<CR>
map <leader>cct :!(cd %:p:h;ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .)<CR>

"Perforce work
nnoremap <leader>p4a :!p4 add %:p
nnoremap <leader>p4e :!p4 edit %:p
nnoremap <leader>p4r :!p4 revert %:p

"Tab Merge
function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    vert topleft split
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    vert topleft split
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

nnoremap <leader>tn :call MoveToNextTab()<CR>
nnoremap <leader>tp :call MoveToPrevTab()<CR>

"GVIM specific settings
set guioptions-=T guioptions-=m

"Asci style C formatting
map <leader>ft :%!astyle --mode=c --style=ansi -s2<CR>

call vundle#end()
filetype plugin indent on                                        " Automatically detect file types
