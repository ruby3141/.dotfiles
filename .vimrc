" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

scripte utf-8
" vim:set fenc=utf-8 tw=0:
" Vim setting for sirini

colorscheme evening
set background=dark

" Vim 전용 기능 사용
set nocp 

" 옵션 복원
set all& 

" 명령어 기록 갯수
set hi=100

" 백스페이스 사용
set bs=indent,eol,start

" 인코딩 설정
"let &tenc=&enc
"set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,ucs-2le,latin1

" 커서 위치 항상 보이기
set ru

" 완성중인 명령을 표시
set sc

" 줄번호 표시
set nu

" 줄 번호 표시 너비 설정
set nuw=5

" 탭 크기 설정
set ts=4
set sw=4

" 탭 >> 공백 변환 사용안함
set noet
set sts=0

" 자동 줄바꿈 함
set wrap

" 마지막 편집 위치 복원 기능
au BufReadPost *
\if line("'￦"")>0 && line("'￦"") <= line("$") |
\ exe "norm g'￦"" |
\endif

" magic 기능 사용
"set magic

" 이동 동작시 줄의 시작으로 자동 이동
set sol

" 비쥬얼 모드 동작 설정
set sel=exclusive

" 괄호짝 찾기에서 <> 도 찾도록 추가
set mps+=<:>

" 새로 추가된 괄호 짝 보여주기
set sm

" 검색어 강조
set hls

" 검색시 파일 끝에서 되돌리기 안함
set nows

" 검색시 대소문자 구별 안함
set ic

" 스마트한 대소문자 구별 기능 사용
set scs

" 항상 status 라인을 표시
set ls=2

" 커스텀 확장자들에게 파일 형식 설정
"au BufRead,BufNewFile *.dic setl ft=php

"파일 형식에 따른 신택스 하이라이팅 켜기
sy enable

" 탭 -> 스페이스
" set expandtab

" 계단현상 제거
set paste

" 자동 들여쓰기 적용
set ai

" 공백문자 표시
"set list lcs=tab:\|.,trail:~
set lcs=tab:\|\ ,trail:.,extends:>,precedes:<
set list

" 텍스트 입력 제한 없음
set tw=0

set foldmethod=indent

" 플러그인 로딩
"set loadplugins

set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-repeat.git'
Plugin 'svermeulen/vim-easyclip.git'
Plugin 'Townk/vim-autoclose.git'
Plugin 'Valloric/YouCompleteMe.git'
Plugin 'rdnetto/YCM-Generator.git'
Plugin 'jeaye/color_coded.git'

call vundle#end()

filetype plugin indent on

" 마우스 설정
"set mouse=n
"set nomousefocus
"set mousemodel=popup

" status 모양
highlight User1 term=underline cterm=bold ctermfg=Cyan ctermbg=Blue gui=underline gui=bold guifg=#40ffff guibg=#0000aa
highlight User2 term=underline cterm=underline ctermfg=green gui=underline guifg=#00ff00
highlight User3 term=underline cterm=underline ctermfg=yellow gui=underline guifg=#ffff00
highlight User4 term=underline cterm=underline ctermfg=white gui=underline guifg=#ffffff
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}]%m " file format
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*/%L,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
set laststatus=2
" ########## Plugin Configure ##########
" EasyClip
let g:EasyClipShareYanks=1

" YCM & YCM_Generator
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_key_invoke_completion = '<Nul>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" ########## Short Cuts ##########
" Shift+Enter로 아래줄로 커서 넘기기 기능
map <S-CR> <ESC>o
map! <S-CR> <ESC>o
"현재 줄의 마지막에 이어 쓰기
map! <C-TAB> <S-CR><ESC>i<BACKSPACE>
" 영역이 지정된 상태에서 Tab과 Shift+Tab으로 들여쓰기/내어쓰기를 할 수 있도록 함

map <F2> :tabnew<CR>
map <F4> :w<CR>
map <C-h> gT
map <C-l> gt
map <C-c> :q<CR>
map <C-s> :w<CR>

"au BufRead,BufNewFile *.py set et sw=4 sts=4
