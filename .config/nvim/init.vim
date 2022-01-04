"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
filetype plugin on

call plug#begin('~/.local/share/nvim/plugged')

" basics
Plug 'kana/vim-arpeggio'
Plug 'wellle/targets.vim'

" wiki
Plug 'vimwiki/vimwiki', { 'branch' : 'dev' }
Plug 'michal-h21/vim-zettel'
Plug 'tbabej/taskwiki'
Plug 'blindFS/vim-taskwarrior'

" navigation
Plug 'ap/vim-buftabline'
Plug 'mattn/calendar-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'troydm/zoomwintab.vim'
Plug 'airblade/vim-rooter'
Plug 'phaazon/hop.nvim'

" formatting and syntax
Plug 'lervag/vim-rainbow-lists', {'branch': 'main'}

Plug 'marcushwz/nvim-workbench', {'branch': 'main'}

Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'ervandew/supertab'
Plug 'kshenoy/vim-signature'

Plug 'liuchengxu/vim-which-key'
Plug 'powerman/vim-plugin-AnsiEsc'

" splits
Plug 'mattboehm/vim-accordion'

" text obj plugins
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'bps/vim-textobj-python'
Plug 'mattn/vim-textobj-url'
Plug 'glts/vim-textobj-comment'

"Tim Pope plugins----------------------------
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-flatfoot'
Plug 'tpope/vim-obsession'

"Programming plugins -------------------------
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-swap'
Plug 'junegunn/gv.vim'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'AndrewRadev/switch.vim'
Plug 'jpalardy/vim-slime'
Plug 'sirver/ultisnips'
Plug 'Zaptic/elm-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'

Plug 'wakatime/vim-wakatime'

Plug 'christoomey/vim-titlecase'

Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim', {'branch': 'main'}

"Color schemes ------------------------------
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'flazz/vim-colorschemes'
Plug 'chrisbra/Colorizer'

Plug 'junegunn/vim-journal'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" neovim
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

" git
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'kdheepak/lazygit.nvim'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()

" get operating system
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

"-------------------------------------------------------------------------------
" Plugin Options
"-------------------------------------------------------------------------------

let g:arpeggio_timeoutlens = {'j':400, 'k':200}
set viminfo='800,<50,s10,h,rA:,rB:

" git 
nnoremap <leader>gg :LazyGit<CR>

" hop
nnoremap S :w<CR>
nnoremap s :HopChar2<CR>

map <leader>o :ZoomWinTabToggle<CR>

" slime options
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend
xmap <leader>s <Plug>SlimeRegionSend
let g:slime_python_ipython = 1

" follow link in task
nmap <c-cr> :VimwikiFollowLink<cr>
" nmap <s-cr> :VimwikiFollowLink<cr>

nmap <leader>nl <Plug>VimwikiVSplitLink
nmap <leader>nr <Plug>VimwikiSplitLink

let g:vimwiki_table_mappings = 0
" let g:vimwiki_diary_rel_path = ''
autocmd FileType vimwiki UltiSnipsAddFiletypes all

noremap <leader>zb :ZettelBackLinks<CR>

nnoremap <leader>zn :ZettelNew<cr><cr>:4d<cr>:w<cr>ggA

let g:zettel_fzf_options = ['+x', '--algo=v2', '--tiebreak=end', '--preview', '''/Users/nathanbraun/.local/share/nvim/plugged/fzf.vim/bin/preview.sh'' {}', '--preview', '''/Users/nathanbraun/.local/share/nvim/plugged/fzf.vim/bin/preview.sh'' {}']

let g:taskwiki_markup_syntax='markdown'

" Disable default keymappings
let g:zettel_default_mappings = 0 

" This is basically the same as the default configuration
augroup filetype_vimwiki
 autocmd!
 autocmd FileType vimwiki imap <silent> [[ [[<esc>:ZettelSearch<CR>:title
 autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
 autocmd FileType vimwiki xmap zx <Plug>ZettelNewSelectedMap
 autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
 " open file bindings
 autocmd FileType vimwiki nmap <leader>ot :ZettelOpen<CR>title: 
 autocmd FileType vimwiki nmap <leader>of :ZettelOpen<CR>
augroup END
let g:rblist_levels = 8

highlight RBListsO0 guifg=#FFFFFF
highlight RBListsO1 guifg=#99ad6a
highlight RBListsO2 guifg=#c6b6ee
highlight RBListsO3 guifg=#8fbfdc
highlight RBListsO4 guifg=#cf6a4c
highlight RBListsO5 guifg=#ffb964
highlight RBListsO6 guifg=#fad07a
highlight RBListsO7 guifg=#f0a0c0

" highlight RBListsB0 guibg=#FF0000
" highlight RBListsB1 guibg=#00FF00
" highlight RBListsB2 guibg=#0000FF
" highlight RBListsB3 guibg=#FF00FF
" highlight RBListsB4 guibg=#00FFFF

highlight RBListsB0 guifg=#c6b6ee
highlight RBListsB1 guifg=#8fbfdc
" highlight RBListsB1 guifg=#ffb964
" highlight RBListsB2 guifg=#8fbfdc
" highlight RBListsB2 guifg=#f0a0c0
highlight RBListsB2 guifg=#fad07a
highlight RBListsB3 guifg=#f0a0c0
" highlight RBListsB3 guifg=#fad07a
highlight RBListsB4 guifg=#8197bf
highlight RBListsB5 guifg=#c6b6ee
highlight RBListsB6 guifg=#c6b6ee
highlight RBListsB7 guifg=#70b950

map <Leader>dw :call <SID>DeleteBufferByExtension("wiki")<CR>

"-------------------------------------------------------------------------------
" Appearance
"-------------------------------------------------------------------------------
set number
set colorcolumn=81

set termguicolors
colorscheme jellybeans

"-------------------------------------------------------------------------------
" Editor Settings
"-------------------------------------------------------------------------------

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab

" search options
set ignorecase

" 2 space tabs in html, js, css
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2
autocmd FileType vimwiki setlocal shiftwidth=2 tabstop=2

if g:os == "Darwin"
    let g:python_host_prog = $HOME.'/neovim-python/bin/python2'
    let g:python3_host_prog = $HOME.'/neovim-python/bin/python'
elseif g:os == "Linux"
    let g:python_host_prog = '/home/nbraun/.virtualenvs/neovim2/bin/python'
    let g:python3_host_prog = '/home/nbraun/.virtualenvs/neovim/bin/python'
endif

"-------------------------------------------------------------------------------
" Behavior
"-------------------------------------------------------------------------------
autocmd! bufwritepost init.vim source % " automatically apply changes in init.vim

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.csv,*.pickle,*.xlsx,*xls,*.docx,*.doc,*.pyc,*.png,*.jgp,*/node_modules/*,*/tmp/*
set noswapfile
set nobackup
set nowb

" show command/search history
noremap : q:i
noremap / q/i

" copy rest of line with Y
map Y y$

" for work linux 
map "* "+

let g:slime_target = "tmux"

"-------------------------------------------------------------------------------
" KEYBINDINGS
"-------------------------------------------------------------------------------
" escape
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

map <leader>x "*
nnoremap <silent> <leader>d "=strftime("%Y-%m-%d")<CR>p
nnoremap <silent> <leader>t "=strftime("%I:%M %p")<CR>p

nnoremap <leader>/ :Ack!<Space>
noremap <Leader>vs :vsplit<CR>
noremap <Leader>hs :split<CR>

" vimwiki bindings
noremap <Leader>wt :VimwikiMakeTomorrowDiaryNote<CR>
noremap <Leader>wj :VimwikiDiaryNextDay<CR>
noremap <Leader>wk :VimwikiDiaryPrevDay<CR>
" nmap <leader>o :Ranger<CR>

map <C-o> :NERDTreeToggle<CR>
let g:NERDTreeShowLineNumbers = 1

noremap <silent><leader>? :setlocal spell! spelllang=en_us<CR>

" taskwiki
noremap <leader>ttna :TaskWikiMod +na<CR>
noremap <leader>tcl :TaskWikiMod -mon -tue -wed -thu -fri<CR>
noremap <leader>twe :TaskWikiMod +week<CR>
noremap <leader>tday :TaskWikiMod +day<CR>
noremap <leader>ttd :TaskWikiMod +deep<CR>
noremap <leader>ttg :TaskWikiMod +gmail<CR>
noremap <leader>ttw :TaskWikiMod +wed<CR>
noremap <leader>tte :TaskWikiMod +entrepreneurship<CR>
noremap <leader>tti :TaskWikiMod +ideas<CR>
noremap <leader>ttp :TaskWikiMod +productivity<CR>
noremap <leader>tts :TaskWikiMod +sm<CR>
noremap <leader>ttc :TaskWikiMod +coding<CR>
noremap <leader>tth :TaskWikiMod +history<CR>
noremap <leader>ttr :TaskWikiMod +read<CR>
noremap <leader>ttb :TaskWikiMod +business<CR>
noremap <leader>ttl :TaskWikiMod +learning<CR>

nnoremap  <leader>j :RBListToggle<CR>

" ultisinps
let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" let g:UltiSnipsSnippetsDir = $HOME."/.config/UltiSnips"
let g:UltiSnipsSnippetsDir = "~/.config/UltiSnips"
" let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/UltiSnips']
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger = "<tab>"
noremap <leader>u :UltiSnipsEdit<CR>

" elm
let g:elm_setup_keybindings = 0


"""""""""""
" shortcuts
"""""""""""
" general
noremap <silent><leader>lz :e ~/vimwiki/zettelkasten.wiki<CR>
noremap <silent><leader>lwe :e ~/vimwiki/week.wiki<CR>
noremap <silent><leader>lqu :e ~/vimwiki/quarter.wiki<CR>
noremap <silent><leader>lcon :e $MYVIMRC<CR>
noremap <silent><leader>lwr :e ~/vimwiki/201024-1021.wiki<CR>
noremap <silent><leader>lqr :e ~/vimwiki/210104-2035.wiki<CR>
noremap <silent><leader>ldr :e ~/vimwiki/210104-2031.wiki<CR>
noremap <silent><leader>lnb :e ~/vimwiki/200807-1511.wiki<CR>
noremap <silent><leader>lki :e ~/vimwiki/kids.wiki<CR>
noremap <silent><leader>lpe :e ~/vimwiki/200807-1458.wiki<CR>
noremap <silent><leader>lta :e ~/vimwiki/210213-1519.wiki<CR>
noremap <silent><leader>lcc :e ~/vimwiki/210207-1419.wiki<CR>
noremap <silent><leader>l1p :e ~/vimwiki/210306-1047.wiki<CR>

" buffers telescope plugins
nnoremap <leader>lf <cmd>Telescope find_files<cr>
nnoremap <leader>lb <cmd>Telescope buffers<cr>
nnoremap <leader>lr <cmd>Telescope oldfiles<cr>
nnoremap <leader>f/ <cmd>Telescope search_history<cr>

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" other maps
nnoremap Q @@
set lazyredraw

set history=10000

augroup vimrc
  autocmd!
  autocmd FileType vimwiki call rblist#enable()
augroup END


augroup nvimrc_aucmd
autocmd!
" https://github.com/neovim/neovim/issues/3463#issuecomment-148757691
autocmd CursorHold,FocusGained,FocusLost * rshada|wshada
augroup END

function!  <SID>DeleteBufferByExtension(strExt)
   let s:bufNr = bufnr("$")
   while s:bufNr > 0
       if buflisted(s:bufNr)
           if (matchstr(bufname(s:bufNr), ".".a:strExt."$") == ".".a:strExt )
              if getbufvar(s:bufNr, '&modified') == 0
                 execute "bd ".s:bufNr
              endif
           endif
       endif
       let s:bufNr = s:bufNr-1
   endwhile
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" function! s:disable_coc_for_type()
"   if index(g:coc_filetypes_enable, &filetype) == -1
"     :silent! CocDisable
"   else
"     :silent! CocEnable
"   endif
" endfunction

" augroup CocGroup
"  autocmd!
"  autocmd BufNew,BufEnter,BufAdd,BufCreate * call s:disable_coc_for_type()
" augroup end

" let g:coc_filetypes_enable = ['py', 'elm', 'js', 'sh']

let g:buftabline_numbers = 1

set signcolumn=yes:1

let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:true
" let bufferline.closable = v:false
let bufferline.icons = 'numbers'

" require('gitsigns').setup()
" lua section
lua << EOF
require('hop').setup()

local custom_attach = function(client)
      if client.config.flags then
        client.config.flags.allow_incremental_sync = true
      end
    end

vim.g.coq_settings = {
    ["clients.tabnine.enabled"] = true,
    ["keymap.manual_complete"] = "<C-p>",
    ["keymap.jump_to_mark"] = "<C-a>"
}

local lsp = require "lspconfig" -- add this
local coq = require "coq" -- add this

lsp.elmls.setup{
    on_attach = custom_attach
}
lsp.elmls.setup(coq{}.lsp_ensure_capabilities{})

lsp.pyright.setup{}
lsp.pyright.setup(coq{}.lsp_ensure_capabilities{})

require("trouble").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}

-- these are all the default values

EOF

" set completeopt-=preview
" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
" lua require 'tagfunc_nvim_lsp'
" setlocal tagfunc=v:lua.tagfunc_nvim_lsp

nnoremap <leader>cc :COQnow<CR>
