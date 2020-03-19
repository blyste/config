" Inspired from Tyler Cipriani's.
" Tyler Cipriani's can be found at
" https://github.com/thcipriani/dotfiles/blob/master/vimrc

" Plugins and Vundle--------------------------------------------------- {{{
set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'cscope.vim'
Plugin 'scrooloose/nerdtree'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" You Complete Me (YCM) ------------------------------------------------- {{{
" White List of .ycm_extra_conf.py for using C-family semantic completion
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['~/Repo/.ycm_extra_conf.py']
" }}}

" cscope and ctags -------------------------------------------------- {{{
" ctags
nnoremap <silent> <F4> :exec "vertical belowright stjump" expand("<cword>")<CR>
set tags=./tags;

" cscope
"autoload
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

" To do the first type of search, hit 'CTRL-spacebar', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar-spacebar' then a search type
" makes the vim window split vertically, with search result displayed in
" the new window.
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
" }}}

" Dude, this isn't 1997 anymore. -------------------------------------- {{{
set nocompatible
" " }}}

" Basic options ------------------------------------------------------- {{{
let mapleader=","
set t_Co=256        " My terminal's got all those colors, yo

set title           " Change the terminal title
set encoding=utf-8  " Show utf-8 chars
set showcmd         " count highlighted
set ruler           " Show where I am in the command area
set colorcolumn=100 " vertical ruler at 100 characters
set showmode        " -- INSERT (appreciation)-- :)
set laststatus=2    " always show the status line
                        " ↪ (0 = never, 1 = default [multi-window only])

set modelines=0     " Don't read first/last lines of file for settings
set hidden          " Stash unwritten files in buffer
set vb              " Don't beep at me
set cursorline      " Highlight current line
set scrolloff=3     " Start scrolling when I'm 3 lines from top/bottom
set history=1000    " Remember commands and search history
set backspace=2     " Backspace over indent, eol, and insert
set mousehide       " Hide the mouse pointer while typing
set mouse=n         " Resize Windows split with mouse
" set mouse=a   	    " I want my click back

set number          " Show linenumbers
set nowrap          " Turn off linewrap
set tabstop=2       " 2 spaces
set shiftwidth=2    " 2 spaces
set softtabstop=2   " 2 spaces
set expandtab       " Expand tabs to spaces

set hlsearch        " highlight my search
set incsearch       " incremental search
set wrapscan        " Set the search scan to wrap around the file
set ignorecase      " when searching
set smartcase       " …unless I use an uppercase character

set showmatch       " show matching brackets
set mat=2

syntax on           " Syntax highlighting
syntax sync minlines=256 " Makes big files slow
set synmaxcol=2048  " Also long lines are slow
set autoindent      " try your darndest to keep my indentation
set smartindent     " Be smarter about indenting dummy

filetype plugin on
filetype indent on

set fileformats=unix,dos,mac

autocmd BufWritePre * :%s/\s\+$//e " Erase endline spaces

set undodir^=~/.vim/undo/ " Places .un~ files in the correct directory
" Colorscheme
" https://github.com/altercation/vim-colors-solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme desert
if has('gui_running')
        set background=light
else
        set background=dark
endif

" GUI Font (same as my gnome-terminal font)
" https://github.com/adobe/source-code-pro
set guifont=Source\ Code\ Pro\ 14

let g:syntastic_c_checkers=['make']
set foldmethod=marker
au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>79v.\+', -1)
" }}}

" Version 7.3 (703) --------------------------------------------------- {{{
if v:version >= 703
        set colorcolumn=80
        set undodir=~/.vim-undo
        set undofile
        set undolevels=1000 "max number of changes that can be undone
        set undoreload=10000 "max number lines to save for undo
        "on buffer reload

        " Toggle line numbers in normal mode, unset by default
        " set relativenumber
        function! NumberToggle()
        "        if(&relativenumber == 1)
                 if(&number == 0)
                        set nu
        "               set nornu
                else
                        set nonu
        "               set rnu
                endif
        endfunc

        nnoremap <leader>n :call NumberToggle()<cr>
endif
" }}}

" Dumb osx ------------------------------------------------------------ {{{
if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
                set clipboard=unnamed
        endif
endif
" }}}

" Convenient Mapping--------------------------------------------------- {{{
" Make regex sane
noremap / /\v

" Dumb escape
inoremap JJ <ESC>
vnoremap JJ <ESC>
" un-highlight search results
noremap <leader><space> :noh<cr>

" Toggle auto-indent before clipboard paste
set pastetoggle=<leader>p

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" Normal/Visual tab for bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l

"Moves around split windows
nnoremap <leader>w <C-w><C-w>

"Delete Blanklines
nnoremap <leader>S :v/\S/d<CR>

"Double Space
nnoremap <leader>D :g/^/put_<CR>

"Real Returns
nnoremap <leader>R :%s/\r/\r/g<CR>

"Moving around windows
map <C-j> <C-W>j
map <A-S-Down> <C-W>j

map <C-k> <C-W>k
map <A-S-Up> <C-W>k

map <C-h> <C-W>h
map <A-S-Left> <C-W>h

map <C-l> <C-W>l
map <A-S-Right> <C-W>l
" }}}

" Status line --------------------------------------------------------- {{{
augroup ft_statuslinecolor
        au!
        au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
        au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END
set statusline=%f " Path.
set statusline+=%m " Modified flag.
set statusline+=%r " Readonly flag.
set statusline+=%w " Preview window flag.
set statusline+=\ " Space.
set statusline+=%= " Right align.
" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)
" }}}

" Development Tools --------------------------------------------------- {{{
" Tagbar (requires Exuberant ctags 5.5+)
noremap <leader>c :TagbarToggle<CR>

" Xdebug local debugger
let g:debuggerPort = 9999

" Spell Checker
:set spell
:set spelllang=en_us
" }}}i

" NERDTree Settings---------------------------------------------------- {{{
"map <leader>t :NERDTreeToggle<CR>
noremap <leader>t :NERDTreeTabsToggle<CR>
" }}}i

" Included for PowerLine ---------------------------------------------- {{{
let g:Powerline_symbols = 'fancy'
" }}}

" Printing options ---------------------------------------------------- {{{
set pdev=pdf    " print in a PDF file
set printoptions=paper:A4,syntax:y,wrap:y
" }}}

" Omni-completion ----------------------------------------------------- {{{
set ofu=syntaxcomplete#Complete
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/llvm
"set tags+=~/.vim/tags/glib
"set tags+=~/.vim/tags/llvm
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Sweet zsh-like autocompletion menu
set wildmenu
set wildmode=list:full
" }}}

" LaTeX options ------------------------------------------------------- {{{
if has("gui_macvim")
        let g:Tex_ViewRule_pdf = 'Preview'
endif

set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set background=dark
" }}}

" Ruby options -------------------------------------------------------- {{{
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
        " Clear old autocmds in group
        autocmd!
        " autoindent with two spaces, always expand tabs
        autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
" }}}

" ARM ASM options ----------------------------------------------------- {{{
let asmsyntax='armasm'
let filetype_inc='armasm'
" }}}
