
" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                  

" Use Unicode characters. Has to be at the top of the file.
" The order of these commands are important.
set encoding=utf-8
scriptencoding utf-8
setglobal fileencodings=utf-8

" source CoC file
"source $HOME/.config/nvim/plug-config/coc.vim

"########################################################################
"#                     V I M  H A R D  M O D E                          #
"########################################################################

for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<Pagedown>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor

"########################################################################
"#                             C O L O R S                              #
"########################################################################

" Change number line colors
highlight LineNr term=bold cterm=bold ctermfg=8

" Highlight the current line number
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermfg=15 ctermbg=8
augroup END

"########################################################################
"#                           P L U G I N S                              #
"########################################################################

call plug#begin('/home/sergio/.config/nvim/plugged')
call plug#end()

"########################################################################
"#                             R E M A P S                              #
"########################################################################

let mapleader = " "

" Change Buffer
nnoremap <C-H> :bprev<CR>
nnoremap <C-L> :bnext<CR>

nnoremap <Leader>ut :UndotreeToggle<CR>
nnoremap <Leader>t :NERDTree<CR>

nnoremap <leader>f :Ranger<CR>

nmap <C-z> <Nop>

nnoremap <Leader>sp :pwd<CR>

" Resize splits
map <Leader>wl :vertical resize -5<CR>
map <Leader>wh :vertical resize +5<CR>

map <Leader>wj :res -5<CR>
map <Leader>wk :res +5<CR>

" LaTeX preview
noremap <Leader>l :StartLatexPreview<CR>

"#######################################################################
"#                       S E T S  &  L E T S                           #
"#######################################################################

" Give access to clipboard
set clipboard=unnamedplus

" Tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase

" Numbering
set relativenumber
set nu

" other
set nohlsearch " remove highlighting after search
set incsearch
set hidden
set noerrorbells
set scrolloff=8

" History
set noswapfile
set nobackup
set undodir=/home/sergio/.config/nvim/undodir
set undofile

" Set linewidth for certain files
autocmd BufRead,BufNewFile *.py setlocal textwidth=80
autocmd BufRead,BufNewFile *.tex setlocal textwidth=120

" Set spelling check
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rmd setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell

set spelllang=en_us

"LanguageTool
let g:languagetool_lang='en-US'
let g:languagetool_jar='/usr/share/java/languagetool/languagetool-commandline.jar'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<nop>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsRemoveSelectModeMappings = 0

nnoremap <leader>es :UltiSnipsEdit!<cr>

" PDF previews
let g:latex_pdf_viewer = 'zathura'
let g:latex_engine='pdflatex'

au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
    \ let g:loaded_matchparen=1 |
    \ set noshowmatch |
set fillchars+=vert:\ 

set showtabline=2  " always show tabline
