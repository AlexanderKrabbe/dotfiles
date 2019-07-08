" begining of my vim config file
" Alexander-vim-config
" Heavily inspired by Fisa-vim 
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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal vim 256 colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
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



