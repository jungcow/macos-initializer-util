set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" For ArgWrap Plugin (https://github.com/FooSoft/vim-argwrap)
Plugin 'foosoft/vim-argwrap'

" For Autotag Plugin (https://github.com/basilgor/vim-autotags)
Plugin 'basilgor/vim-autotags'

" For Show directory file tree
Plugin 'scrooloose/nerdtree'

" vim-devicons - NerdTree directory icons
Plugin 'ryanoasis/vim-devicons'

" For show git diff through [+/-]
Plugin 'airblade/vim-gitgutter'

" For fantastic vim status bar
Plugin 'vim-airline/vim-airline'

" For git info in vim status bar
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" let plug manage vim plugin
call plug#begin('~/.vim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Syntax Highlighting
if has("syntax")
	syntax on
endif

set autoindent
autocmd FileType c,cpp,java : set cindent "지정된 filetype에 대해 cindent를 적용한다
set cinoptions=g0,t0 "switch~case문 등 세부 indent를 정의한다
                    "참고(http://vimdoc.sourceforge.net/htmldoc/indent.html)
set ts=4 " Tab 너비
set shiftwidth=4 " shift키 두번으로 자동 인덴트 시 너비

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

"set laststatus=2 " 상태바 표시를 항상한다
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

set hlsearch " 검색어 하이라이팅
" set scrolloff=2
" set wildmode=longest,list
" set sts=4 "st select
" set sw=1 " 스크롤바 너비
set mouse=a " 마우스 스크롤 가능하게 함
" set autowrite " 다른 파일로 넘어갈 때 자동 저장
" set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
" set bs=eol,start,indent
" set history=256
" set paste " 붙여넣기 계단현상 없애기
set showmatch " 일치하는 괄호 하이라이팅
" set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch " 검색시 단어 전체를 입력하지 않아도, 입력된 글자까지 순차적으로 검색한다

" set textwidth=80 "col 수가 80이 넘어가면 줄바꿈한다 
set colorcolumn+=1 "81번째줄 색을 바꾼다(line length 맞추기 위한 guideline)
hi ColorColumn ctermbg=235 "세로줄 색깔

" ================================ Arg_wrap settings ================================
" Variables
let g:argwrap_padded_braces = '[{('

" Key Binding
nnoremap <silent> <leader>a :ArgWrap<CR>

" ================================ Ctags settings ===================================
set tags +=./tags,tags
nnoremap <silent> <C-[> <Esc>:po<CR>

" ================================ NerdTree settings ================================
nnoremap <leader>nt <Esc>:NERDTree<CR>;
set encoding=UTF-8
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" ================================ Ctrlp settings ================================
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
\ }

" ================================ Coc settings ================================
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
