let s:cpo_save=&cpo
set cpo&vim
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <C-W> u
inoremap <C-U> u
nnoremap  zz
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
nnoremap  zz
nnoremap e =
nnoremap h _
nnoremap m |
nmap  d
nnoremap d T
tnoremap  
nnoremap  <Cmd>nohlsearch
nnoremap  mo :Task set_task_param cmake configure args
nnoremap  pu :Task start cmake clean
nnoremap  co :Task start cmake configure
nnoremap  bu :Task start cmake build
nnoremap  fi :lua require('neogen').generate({ type = 'file' })
nnoremap  ct :lua require('neogen').generate({ type = 'type' })
nnoremap  cf :lua require('neogen').generate({ type = 'func' })
nnoremap  cc :lua require('neogen').generate({ type = 'class' })
nnoremap  tl :hi CursorLine guibg=NONE ctermbg=NONE gui=underline cterm=underline
nnoremap  nl :hi clear CursorLine
nnoremap  cl :s/$/\ \/\/\!\<\ /g<Left><Left>
nnoremap <silent>  rp <Cmd>term python %
nnoremap  s :%s/\<\>//gI<Left><Left><Left>
vnoremap  d "_d
nnoremap  d "_d
nnoremap  Y "+Y
vnoremap  y "+y
nnoremap  y "+y
xnoremap  p "_dP
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
xnoremap <silent> <expr> @ mode() == 'V' ? ':normal! @'.getcharstr().'' : '@'
vnoremap J :m '>+1gv=gv
vnoremap K :m '<-2gv=gv
nnoremap N Nzzzv
xnoremap <silent> <expr> Q mode() == 'V' ? ':normal! @=reg_recorded()' : 'Q'
nnoremap Y y$
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
xmap a% <Plug>(MatchitVisualTextObject)
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
nnoremap n nzzzv
nnoremap t4 <Cmd> tabnext 4 
nnoremap t3 <Cmd> tabnext 3 
nnoremap t2 <Cmd> tabnext 2 
nnoremap t1 <Cmd> tabnext 1 
nnoremap tc <Cmd> tabclose 
nnoremap tn <Cmd> tabnew 
nnoremap tm <Cmd> tabm  
nnoremap te <Cmd> tabedit  
nnoremap tk <Cmd> tabnext 
nnoremap tj <Cmd> tabprev 
nnoremap th <Cmd> tabfirst 
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
nnoremap <M-s> -
nnoremap <M-t> +
nnoremap <M-.> 5>
nnoremap <M-,> 5<
nnoremap <C-W>e =
nnoremap <C-W>h _
nnoremap <C-W>m |
nnoremap <C-U> zz
nnoremap <C-D> zz
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nmap <C-W><C-D> d
nnoremap <C-W>d T
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set background=light
set expandtab
set foldlevelstart=99
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ -uu\ 
set guifont=font-hack-nerd-font
set helplang=en
set isfname=#,$,%,+,,,-,.,/,48-57,=,@,_,~,@-@
set laststatus=3
set listchars=eol:\\u21b5,tab:\\x20\\x20
set noloadplugins
set packpath=/opt/homebrew/Cellar/neovim/0.10.0/share/nvim/runtime
set runtimepath=~/.config/nvim,~/.local/share/nvim/lazy/lazy.nvim,~/.local/share/nvim/lazy/neovim-tasks,~/.local/share/nvim/lazy/harpoon,~/.local/share/nvim/lazy/promise-async,~/.local/share/nvim/lazy/nvim-ufo,~/.local/share/nvim/lazy/telescope-ui-select.nvim,~/.local/share/nvim/lazy/telescope-fzf-native.nvim,~/.local/share/nvim/lazy/plenary.nvim,~/.local/share/nvim/lazy/telescope.nvim,~/.local/share/nvim/lazy/nvim-web-devicons,~/.local/share/nvim/lazy/fidget.nvim,~/.local/share/nvim/lazy/cmp_luasnip,~/.local/share/nvim/lazy/LuaSnip,~/.local/share/nvim/lazy/cmp-cmdline,~/.local/share/nvim/lazy/cmp-path,~/.local/share/nvim/lazy/nvim-cmp,~/.local/share/nvim/lazy/cmp-buffer,~/.local/share/nvim/lazy/cmp-nvim-lsp,~/.local/share/nvim/lazy/mason-lspconfig.nvim,~/.local/share/nvim/lazy/mason.nvim,~/.local/share/nvim/lazy/nvim-lspconfig,~/.local/share/nvim/lazy/conform.nvim,~/.local/share/nvim/lazy/indent-blankline.nvim,~/.local/share/nvim/lazy/nvim-treesitter-textobjects,~/.local/share/nvim/lazy/nvim-treesitter,~/.local/share/nvim/lazy/neogen,~/.local/share/nvim/lazy/alabaster.nvim,/opt/homebrew/Cellar/neovim/0.10.0/share/nvim/runtime,/opt/homebrew/Cellar/neovim/0.10.0/share/nvim/runtime/pack/dist/opt/matchit,/opt/homebrew/Cellar/neovim/0.10.0/lib/nvim,~/.local/share/nvim/lazy/cmp_luasnip/after,~/.local/share/nvim/lazy/cmp-cmdline/after,~/.local/share/nvim/lazy/cmp-path/after,~/.local/share/nvim/lazy/cmp-buffer/after,~/.local/share/nvim/lazy/cmp-nvim-lsp/after,~/.local/share/nvim/lazy/indent-blankline.nvim/after,~/.local/share/nvim/lazy/alabaster.nvim/after,~/.config/nvim/after,~/.local/state/nvim/lazy/readme
set scrolloff=8
set shiftwidth=3
set smartindent
set softtabstop=3
set statusline=%!luaeval('Status_line()')
set noswapfile
set tabstop=3
set termguicolors
set textwidth=90
set updatetime=50
set wildmode=longest,list,full
set window=45
" vim: set ft=vim :
