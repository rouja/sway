" download vim-plug if missing
if empty(glob("~/.vim/bundle/Vundle.vim"))
  silent! execute '!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
  autocmd VimEnter * silent! PlugInstall
endif

set nocompatible              " be iMproved, required
set hidden
set encoding=utf-8
filetype off                  " required
let mapleader = ","
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'airblade/vim-gitgutter'
Plugin 'instant-markdown/vim-instant-markdown'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'chengzeyi/fzf-preview.vim'
Plugin 'moorereason/vim-markdownfmt'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'jasonccox/vim-wayland-clipboard'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'hashivim/vim-terraform'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'dense-analysis/ale'
Plugin 'kdheepak/lazygit.nvim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
colorscheme dracula

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceUseArrowsInTerm = 1
let g:markdownfmt_command = 'markdownfmt'
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd
au FileType markdown nmap <leader>s :<C-u>call markdownfmt#Format()<CR>

syntax on

"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

" let g:airline_theme='base16_nord'
let g:airline_theme='dracula'

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" opens search results in a window w/ links and highlight the matches
nnoremap <silent> <Leader>f :FZF<CR>
nnoremap <Leader>F :FZF -q <C-R>"<CR>
nnoremap <Leader>g :Ag 
nnoremap <silent> <Leader>e :!sops %<CR><CR>
nnoremap <silent> <Leader>n :cn<CR>
nnoremap <silent> <Leader>p :cp<CR>
nnoremap <silent> <Leader>d :bd<CR>
xnoremap <silent> <C-@> y:!wl-copy <C-R>"<CR><CR>
nnoremap <silent> <Leader>k+a :! kubectl apply -f %<CR>
nnoremap <Leader>tp :! cd '%:p:h'; terragrunt plan<CR>

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
