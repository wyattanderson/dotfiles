set nocompatible
filetype off
filetype plugin indent on

call plug#begin('~/.vim-plug')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Plug 'solarnz/arcanist.vim'
Plug 'bling/vim-airline'
Plug 'kevints/vim-aurora-syntax'
Plug 'tpope/vim-commentary'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'stephpy/vim-yaml'
Plug 'solarnz/thrift.vim'
Plug 'wting/rust.vim'
Plug 'fatih/vim-go'
Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
" Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/a.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'Shougo/neosnippet.vim'
" Plug 'honza/vim-snippets'
Plug 'jparise/vim-graphql'
Plug 'zainin/vim-mikrotik'
Plug 'editorconfig/editorconfig-vim'
Plug 'saltstack/salt-vim'
Plug 'jxnblk/vim-mdx-js'

if has('nvim')
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'zchee/deoplete-jedi'

    " Plug 'flowtype/vim-flow'
    " Plug 'w0rp/ale'

    " Plug '/usr/local/opt/fzf'
    " Plug 'junegunn/fzf.vim'
    " nnoremap <c-p> :FZF<cr>
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate javascript html python go'}  " We recommend updating the parsers on update
    Plug 'windwp/nvim-ts-autotag'

    Plug 'windwp/nvim-autopairs'

    set completeopt=menu,menuone,noselect
endif

call plug#end()

syntax on

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set copyindent
set number
set hlsearch
set ruler
set novisualbell
set noerrorbells
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmenu
set laststatus=2
set showbreak=>
set textwidth=78
set formatoptions=croqnl1
set cursorline
set relativenumber
set showmatch
set mouse=a

inoremap kj <ESC>
inoremap zkj <ESC>:w<CR>

let mapleader = ","

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>
map <silent> <leader><space> :let @/=''<CR>

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

" No arrow keys for you!
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" Set up shortcut for toggling number modes since numbertoggle doesn't do it
" for us anymore
nnoremap <silent> <C-n> :set relativenumber!<cr>

silent! colorscheme solarized
set background=dark

if exists('+colorcolumn')
    set colorcolumn=+1,120
endif

let g:airline_powerline_fonts = 1

if executable('rg')
  set grepprg=rg\ --color=never
endif

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:flow#showquickfix = 0

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'python': [],
\  'java': []
\}
let g:ale_fixers = {
\  'javascript': ['prettier']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

nnoremap <silent> <leader>l :call system('arc browse ' . expand('%:p') . ':' . line('.'))<CR>
vnoremap <silent> <leader>l :<C-U>call system('arc browse ' . expand('%:p') . ':' . line("'<") . '-' . line("'>"))<CR>

set conceallevel=0

if has('nvim')
    lua <<EOF
      -- Setup nvim-cmp.
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
          end,
        },
        mapping = {
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      -- Setup lspconfig.
      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      require('lspconfig')['tsserver'].setup {
        capabilities = capabilities
      }

      -- Set up nvim-ts-autotag
      require('nvim-ts-autotag').setup()

      -- Set up nvim-autopairs for autopair matching
      require('nvim-autopairs').setup{}

EOF
endif
