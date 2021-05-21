" 按f8秀出taglist的視窗
"nnoremap <silent> <F8> :TlistToggle<CR><CR>
" Open and close all the three plugins on the same time
 nmap <f6>  :TrinityToggleAll<CR>
" " Open and close the srcexpl.vim separately
 nmap <f7>  :TrinityToggleSourceExplorer<CR>
" " Open and close the taglist.vim separately
 nmap <f8>  :TrinityToggleTagList<CR>
" " Open and close the NERD_tree.vim separately
 nmap <f9> :TrinityToggleNERDTree<CR>
" " Back to last modified line

let g:Tlist_WinWidth=30
let g:NERDTreeWinSize=20
let g:SrcExpl_winHeight=2 
let g:SrcExpl_refreshTime = 100 

" :Tlist   調整TagList
let Tlist_Show_One_File=0                    " 只顯示目前文件的tagslet Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最後一個視窗則退出Vim
"let Tlist_Use_Right_Window=1                 " 在右邊視窗中顯示
let Tlist_File_Fold_Auto_Close=1             " 自動折疊

" RED='\033[0;31m'

set t_Co=256

let tags=$TAGS

set tags+=$TAGS

" search selected text with regular expression
"vnoremap // y/<C-R>"<CR>

vnoremap // y/\V<C-R>"<CR>

" visually select a search result
" nnoremap g/ //e<Enter>v??<Enter>
" colorscheme desert
" colorscheme cherryblossom 


""""""""""   Vundle 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
" 
" Color scheme 
Plugin 'rakr/vim-two-firewatch'
Plugin 'rakr/vim-one'
"Plugin 'lifepillar/vim-wwdc16-theme'
Plugin 'lifepillar/vim-wwdc17-theme'

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'wesleyche/SrcExpl'
Plugin 'scrooloose/nerdtree'
Plugin  'vim-scripts/taglist.vim'
Plugin  'wesleyche/Trinity'

" ...

" 確保所有套件加入在此指令之前 "
call vundle#end()
filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

"""""""""""""""""  End of Vundle

set background=dark " or light if you prefer the light version

"colorscheme seattle 
"colorscheme wwdc16
"let g:wwdc16_term_italics = 1
"let g:wwdc16_term_trans_bg = 1

"colorscheme wwdc17
"let g:wwdc17_frame_color = 10
"let g:wwdc17_high_contrast = 1
"let g:wwdc17_term_italics = 1
"let g:wwdc17_term_trans_bg = 1

" colorscheme dutch_peasants
"colorscheme broduo
"colo  eclipse-lite
"colorscheme dubs_midnight


"
"" color scheme plugin vim-two-firewatch
"set background=dark " or light if you prefer the light version
"set background=dark " or light if you prefer the light version
"let g:two_firewatch_italics=1
"colo two-firewatch
"let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme

"" color shceme plugim rakr/vim-one
"let g:airline_theme='one'
"colorscheme one
""""""""""


hi Normal guibg=#c7edcc guifg=Black "背景:綠色護眼色
hi LineNr guibg=#99cc99 guifg=#99ccff ctermbg=7777 ctermfg=blue "設定行號的顏色


"""""  setting cscopequifix, search result in a new window
 set cscopequickfix=s-,c-,d-,i-,t-,e-
 nmap <C-n> :cnext<CR>
 nmap <C-p> :cprev<CR> 
"nmap <C-t> :colder<CR>:cc<CR>
"

" Tab navigation like Firefox.
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" nnoremap <C-PageUp> :tabprevious<CR>
" nnoremap <C-PageDown>   :tabnext<CR>
" inoremap <C-PageUp> <Esc>:tabprevious<CR>i
" inoremap <C-PageDown>   <Esc>:tabnext<CR>i
" map  <C-l> :tabn<CR>
" map  <C-h> :tabp<CR>
" inoremap <C-h> <Esc>:tabprevious<CR>i
" inoremap <C-l> <Esc>:tabnext<CR>i
 nnoremap <C-e>     :tabnew<CR>
 inoremap <C-e>     <Esc>:tabnew<CR>
 nnoremap <C-x>     :tabclose<CR>


" let mapleader = " "
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
" noremap <leader>6 6gt
" noremap <leader>7 7gt
" noremap <leader>8 8gt
" noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>

" inoremap <leader>1 <ESC>1gt
" inoremap <leader>2 <ESC>2gt
" inoremap <leader>3 <ESC>3gt
" inoremap <leader>4 <ESC>4gt
" inoremap <leader>5 <ESC>5gt
" inoremap <leader>6 <ESC>6gt
" inoremap <leader>7 <ESC>7gt
" inoremap <leader>8 <ESC>8gt
" inoremap <leader>9 <ESC>9gt
" inoremap <leader>0 <ESC>:tablast<cr>

 noremap <S-F1> 1gt
 noremap <S-F2> 2gt
 noremap <S-F3> 3gt
 noremap <S-F4> 4gt
 noremap <S-F5> 5gt
 noremap <S-F6> 6gt
 noremap <S-F7> 7gt
 noremap <S-F8> 8gt
 noremap <S-F9> 9gt
" noremap <leader> :tablast<cr>

 inoremap <S-F1> <ESC>1gt
 inoremap <S-F2> <ESC>2gt
 inoremap <S-F3> <ESC>3gt
 inoremap <S-F4> <ESC>4gt
 inoremap <S-F5> <ESC>5gt
 inoremap <S-F6> <ESC>6gt
 inoremap <S-F7> <ESC>7gt
 inoremap <S-F8> <ESC>8gt
 inoremap <S-F9> <ESC>9gt

 set backspace=indent,eol,start
 :fixdel
 set hlsearch
" set expandtab
" set tabstop=4

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk" || _curfile =~ ".*\.dat"
        set noexpandtab
else
        set expandtab
        set tabstop=4
        set shiftwidth=4
endif

" showing ^M
" :e ++ff=unix


set statusline=%y\ %t\%r%h%w\ %m%=\ %{&fileencoding}\ [%{&ff}]\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [LINE=%L]\ [Pos=%l,%v,%p%%]

 set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
 let OmniCpp_GlobalScopeSearch   = 1
 let OmniCpp_DisplayMode         = 1
 let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
 let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
 let OmniCpp_ShowAccess          = 1 "show access in pop-up
 let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
 set completeopt=menuone,menu,longest

 let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
 highlight   clear
 highlight   Pmenu         ctermfg=0 ctermbg=2
 highlight   PmenuSel      ctermfg=0 ctermbg=7
 highlight   PmenuSbar     ctermfg=7 ctermbg=0
 highlight   PmenuThumb    ctermfg=0 ctermbg=7

" make the cut a really delete, put them in trash can \"_ instead of default register "0
nnoremap x "_x

" you can still have you original x with leadkey
let mapleader = ","
let g:mapleader = ","
nnoremap <leader>x ""x

"" Color
" set t_Co=256
 colorscheme gotham256
" colorscheme lucius
" colorscheme calmar256-dark


set ai tabstop=4 shiftwidth=4 expandtab
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

