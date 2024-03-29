set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"Plugin 'gmarik/Vundle.vim'

Plugin 'psf/black'



Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'

" Colors
Plugin 'jnurmine/Zenburn' " terminal mode colors
Plugin 'altercation/vim-colors-solarized' " GUI mode colors
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:SimpylFold_docstring_preview = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
autocmd BufWritePre *.py execute ':Black'




" COLORS
"if has('gui_running')
	"set background=dark
	"colorscheme=solarized
"else
	"set t_Co=256
	"colorscheme zenburn
	"syntax enable
	"set background=dark
	"colorscheme solarized
	"let g:seoul256_background = 234
	"colo seoul256
"endif
"
" Zenburn

colorscheme zenburn
hi Normal guibg=NONE ctermbg=NONE


" Solarized
"set background=dark
"let g:solarized_termcolors=16
"let g:solarized_termtrans=1
"colorscheme solarized

" Gruvbox
"colorscheme gruvbox
"set bg=dark

"let g:solarized_use16=1
" syntax enable






"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" call togglebg#map("<F5>") " toggle switch for colorschemes
"
" CTAGS
set tags=tags


" Enable folding
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar as opposed to za
nnoremap <space> za

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=red


au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/ " trailing whitespace

set encoding=utf-8
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "Ignore files in NERDTree

let python_highlight_all=1
syntax on



set nu " line numbers
set noswapfile

"""BASIC TOOLS
" Navigating with Guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>







"""LATEX
" To use the latex preview use :LLPStartPreview
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<spacE><c-r>%<Enter>i
autocmd FileType tex nnoremap <F5> :!xelatex<spacE><c-r>%<Enter>
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fit \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;fig \begin{figure}<Enter><Enter>\end{figure}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex vnoremap : <ESC>`<i{\<ESC>`>2la}<ESC>?{\\<Enter>la
autocmd FileType tex inoremap {{ <Esc>F{i
autocmd FileType tex inoremap }} <Esc>f}a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;mm $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;ll <++><Esc>0
autocmd FileType tex inoremap ;bm \begin{bmatrix}<Enter><Enter>\end{bmatrix}<Enter><Enter><++><Esc>3kA

"""MARKDOWN
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|R<space>--vanilla<enter>

"""END
