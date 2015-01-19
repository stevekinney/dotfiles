set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Vim Plugins via Vundle

Plugin 'Lokaltog/vim-easymotion'
Plugin 'Spaceghost/vim-matchit'
Plugin 'Townk/vim-autoclose'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ap/vim-css-color'
Plugin 'beaugunderson/vim-scss-instead'
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'digitaltoad/vim-jade'
Plugin 'docunext/closetag.vim'
Plugin 'duskhacker/sweet-rspec-vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'godlygeek/tabular'
Plugin 'guns/vim-clojure-static'
Plugin 'henrik/vim-ruby-runner'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'matthias-guenther/hammer.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mileszs/ack.vim'
Plugin 'mmalecki/vim-node.js'
Plugin 'msanders/snipmate.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'toyamarinyon/vim-swift'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/L9'
Plugin 'vitaly/vim-syntastic-coffee'
Plugin 'wting/rust.vim'

call vundle#end()            " required

syntax on
filetype plugin indent on    " required

set encoding=utf-8
set nocompatible
set modelines=0
set fillchars+=stl:\ ,stlnc:\

set showcmd
set showmode

set mouse=a                     " Use mouse support in XTerm/iTerm.

" Stuff involving tabs
set expandtab                   " Use soft tabs
set tabstop=2                   " Tab settings
set autoindent
set shiftwidth=2                " Width of autoindent
set smarttab                    " Use shiftwidth to tab at line beginning
set list                        " Show whitespace
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=⇡\ 

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Lines, numbers, and wrapping
set number                      " Line numbers
set cursorline                  " Highlight current line
set nowrap                      " No wrapping
set formatoptions=qrn1
set colorcolumn=80              " Show me the end of the page
set ruler
set scrolloff=3                 " Scroll when the cursor is 3 lines from edge

set backspace=indent,eol,start  " Let backspace work over anything.

set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

nnoremap <leader>0 :call NumberToggle()<cr>

" Remove all trailing whitespace
nmap <leader>ws :%s/\s\+$<CR>

" Ctrl-P Setting
let g:ctrlp_working_path_mode = 'ra'

" Airline Configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDCommenter
map <leader>/   <plug>NERDCommenterToggle
map <D-/>       <plug>NERDCommenterToggle
imap <D-/>      <Esc><plug>NERDCommenterToggle i

" NERDTree
map <leader>n :NERDTreeToggle<CR>

" Ragtag suggestions
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

" Getting wild
set wildmenu
set wildmode=list:longest
set wildignore+=tags               " Ignore tags when globbing.
set wildignore+=tmp/**             " ...Also tmp files.
set wildignore+=public/uploads/**  " ...Also uploads.
set wildignore+=public/images/**   " ...Also images.
set wildignore+=vendor/**          " ...Also vendor.

set lbr

" Filetype-specific Setting
command! FJ set filetype=javascript
command! FR set filetype=ruby
autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

set showmatch                   " Show matching brackets

set hidden                      " Allow hidden, unsaved buffers
set splitright                  " Add new windows towards the right
set splitbelow                  " ... and bottom

" More detailed status line
set statusline=[%n]\ %f\ %m\ %y
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%=              " Left/right separator
set statusline+=%c,             " Cursor column
set statusline+=%l/%L           " Cursor line/total lines
set statusline+=\ %P            " Percent through file

set laststatus=2                " Always show statusline

" Searching
set incsearch                     " Incremental search
set gdefault                      " Automatically search globally
set history=1024                  " History size
set ignorecase                    " Ignore case by default
set smartcase                     " Care about case if I use a capital

" double percentage sign in command mode is expanded
cnoremap %% <C-R>=expand('%:h').'/'<cr>

set autoread                      " No prompt for file changes outside Vim

set swapfile                      " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

" Save when losing focus
set autowriteall
autocmd BufLeave,FocusLost * silent! wall

" Turn off ri tooltips that don't work with Ruby 1.9 yet
" http://code.google.com/p/macvim/issues/detail?id=342
if has("gui_running")
  set noballooneval
endif

" Disable help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Ruby's hashrocket
imap <C-l> <space>=><space>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildmenu

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif  " Keybindings

" Make Y consistent with D and C
map Y           y$

" Search
nmap <leader>ss    :%s/
vmap <leader>ss    :s/

" Yank to the OS X clipboard
vnoremap <leader>yo "*y
" Paste from the OS X clipboard
nnoremap <leader>po "*p

" Surround a word (follow this with the surrounding character)
nmap <leader>sw   ysiw

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Reload .vimrc
map <leader>rv  :so ~/.vimrc<CR>
map <leader>ev  :e ~/.vimrc<CR>

" Jump to a new line in insert mode
imap <S-CR>     <Esc>o
imap <C-S-CR>   <Esc>O

" Previous/next quickfix file listings (e.g. search results)
map <M-C-Down>  :cn<CR>
map <M-C-Up>    :cp<CR>

" Previous/next buffers
map <M-C-Left>  :bp<CR>
map <M-C-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" Buffergator
map <C-x>      :BuffergatorToggle<CR>

" Emacs-bindings
cnoremap <c-a> <home>
cnoremap <c-e> <end>
nnoremap <C-e>  $
nnoremap <C-a>  ^
imap <C-e>  <esc>A
imap <C-a>  <esc>I

" Easy access to the shell
map <Leader><Leader> :!

if !has("gui_running")
  " Map Cmd-S to <F12> in iTerm2 for Save.
  map <F11> :w<CR>
  map! <F11> <C-o>:w<CR>
end

colorscheme tomorrow-night
let g:closetag_html_style = 1

" Configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
" Ignore Angular silliness when Syntastic is checking HTML files
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Get off my lawn (Disable arrow keys)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" File Shortcuts
nmap <leader>td :sp ~/Dropbox/Elements/Workflow.txt<CR>

" Use Github-Flavored Markdown by default
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'rb=ruby', 'sass', 'xml']
