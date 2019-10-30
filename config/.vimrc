" begining of my vim config file
" Alexander-vim-config
" Inspired by Fisa-vim 
" http://fisadev.github.io/fisa-vim-config/
" 
"
" ===================================================
" Vim-plug
"

call plug#begin('~/.vim/plugged')

" vimwiki
Plug 'vimwiki/vimwiki'

" vim latex
Plug 'xuhdev/vim-latex-preview', { 'for';: 'tex' }

" Git integration 
Plug 'motemen/git-vim'


"airline - theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal vim 256 colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
Plug 'jacoborus/tender.vim'
" auto close smart
Plug 'Townk/vim-autoclose'
" indent wise, might come in handy, I like the feature now
Plug 'jeetsukumaran/vim-indentwise'
" vim jedi for autocompletion, however, I have not yet figured out the
" niceness of the plugin yet
" Plug 'davidhalter/jedi-vim'
" Sort imports in python scripts (it is jus nice)
Plug 'fisadev/vim-isort'
" Choose win is nice and works sort of like tmux. invoke by '-' in normal mode
Plug 't9md/vim-choosewin'
"syntax code checker for Python, TeX and other
"Plug 'scrooloose/syntastic'
"paint css colors with the real colore - i like this
Plug 'lilydjwg/colorizer'

call plug#end()

" if you have vim >=8 
if (has("termguicolors"))
    set termguicolors
endif

" use tender colour 
syntax enable
colorscheme tender

" set airline theme
let g:airline_theme = 'tender' 
let macvim_skip_colorscheme = 1

" for latex
let g:livepreview_previewer = 'open -a Preview'

" spaces and tabs
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set number
set ls=2 "always show the status bar"
set showcmd "show the last command in the right lower corner"
set incsearch "highlight search results while typing"
set hlsearch "highlight previous search results"
set cursorline "highlight the line with the cursor"
set scrolloff=3 "when scrolling keep the cursor 3 lines ayaw from screen border"

"set wildmode=list:longest "autocompletion of files and command behaves like
"shell (i doúnno if i linke this, so now it is disable
"


