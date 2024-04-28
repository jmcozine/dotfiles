set nocompatible	" don't be vi compatible
syntax enable		" pretty colors

if filereadable("/usr/share/vim/vimfiles/colors/zenburn.vim")
    let g:zenburn_high_Contrast=1
    let g:zenburn_color_also_Ignore=1
    let g:zenburn_force_dark_Background=1
    colorscheme zenburn	" low contrast color scheme
endif

set modelineexpr    " All per-file settings from modelines
set history=1000	" default is 50
set expandtab		" only use spaces
set showcmd         " show partial command
set shiftwidth=4	" auto-indent to 4 spaces
set tabstop=4       " TAB uses 4 spaces
set number          " line numbers
set relativenumber	" line numbers relative to cursor
set path+=**		" include subdirectories when finding files
set wildmenu		" menu for tab completion in command-line mode
filetype plugin indent on	" omni completion based on filetype
set laststatus=2    " always display the statusline in all windows
set showtabline=2   " always display the tabline, even if there is only one tab
set noshowmode      " hide the default mode text
set autoindent
