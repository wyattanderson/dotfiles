set nocompatible
filetype off
filetype plugin indent on
let mapleader = ","

call plug#begin('~/.vim-plug')

Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
" Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Plug 'lifepillar/vim-solarized8'
Plug 'solarnz/arcanist.vim'
Plug 'bling/vim-airline'
Plug 'kevins/vim-aurora-syntax'
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
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'mxw/vim-jsx'
" Plug 'prettier/vim-prettier'
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
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/lsp-colors.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    set completeopt=menu,menuone,noselect

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate javascript html python go'}  " We recommend updating the parsers on update
    Plug 'windwp/nvim-ts-autotag'
    Plug 'windwp/nvim-autopairs'

    " For trouble.nvim and its dependencies
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'

    " For todo-comments
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'

    " For telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    nnoremap <c-p> <cmd>Telescope find_files<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>

    Plug 'sbdchd/neoformat'
    autocmd BufWritePre *.tsx,*.ts,*.js Neoformat
    let g:neoformat_try_node_exe = 1

    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
    Plug 'ray-x/navigator.lua'

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

set termguicolors
let g:solarized_termtrans = 1
silent! colorscheme solarized8
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
        mapping = cmp.mapping.preset.insert({
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
        }),
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
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      -- require('lspconfig')['tsserver'].setup {
      --   capabilities = capabilities
      -- }
      -- require('lspconfig')['gopls'].setup {
      --   capabilities = capabilities,
      --   settings = {
      --     gopls = {
      --       buildFlags =  {"-tags=wireinject"},
      --       env = {GOFLAGS="-tags=wireinject"}
      --     }
      --   }
      -- }

      -- Set up nvim-ts-autotag
      require('nvim-ts-autotag').setup()

      -- Set up nvim-autopairs for autopair matching
      require('nvim-autopairs').setup{}

      require("trouble").setup{}

      require("todo-comments").setup{}
      vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>TroubleToggle<cr>",
      {silent = true, noremap = true})

      require'navigator'.setup{
        -- unmap this fucking key so it doesn't conflict with vim-go
        keymaps = {{key = "<Leader>gdt", func = "require('navigator.diagnostics').toggle_diagnostics()"}},
        lsp = {
            disable_lsp = {'ngserver', 'deno', 'graphql-lsp'},
            disable_format_cap = {"tsserver"},
            },
      }

      require'nvim-treesitter.configs'.setup {
          highlight = {
              enable = true,
          }
      }

EOF
endif

imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

map <Leader>n :vsplit <C-R>=expand("%:p:h") . "/" <CR>

let g:go_build_tags = 'wireinject'
let g:go_fillstruct_mode = 'gopls'
let g:go_alternate_mode = 'vsplit'
let g:go_imports_mode = 'goimports'

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
  let g:go_fmt_options = {
    \ 'goimports': '-local gitlab.com/levelbenefits/level',
    \ }
