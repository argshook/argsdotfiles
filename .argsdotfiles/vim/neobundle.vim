" hey, you need to split this up
" yeah i know

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" essentials
NeoBundle 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete
NeoBundle 'tpope/vim-rhubarb'
NeoBundle 'jreybert/vimagit'
NeoBundle 'Shougo/vimproc.vim' " required by Quramy/tsuquyomi
autocmd Filetype typescript nnoremap <leader>a :echo tsuquyomi#hint()<cr>


NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-surround'
let g:surround_indent = 0
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'wellle/targets.vim'
NeoBundle 'junegunn/fzf'
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'rafaqz/ranger.vim'

NeoBundle 'mhinz/vim-signify', {'build': {'unix': 'npm install'}}
let g:signify_realtime = 0 " this doesnt work something somewhere sets it to 1 wtf
NeoBundle 'christoomey/vim-tmux-navigator'
" when tmux pane is zoomed, don't zoomout when navigating out of vim
let g:tmux_navigator_disable_when_zoomed = 1

" snippets
NeoBundle 'Shougo/deoplete.nvim'
let g:deoplete#file#enable_buffer_path = 1
" NeoBundle 'davidhalter/jedi'
" NeoBundle 'zchee/deoplete-jedi'
" let g:deoplete#sources#jedi#show_docstring = 1
" NeoBundle 'pbogut/deoplete-elm'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Valloric/YouCompleteMe' " do `./install.py --js-completer` in ~/.vim/bundle/YouCompleteMe
let g:ycm_key_detailed_diagnostics = ''

" language specific
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'moll/vim-node'
NeoBundle 'Quramy/tsuquyomi' " for typescript
let g:tsuquyomi_disable_quickfix = 0
NeoBundle 'mxw/vim-jsx'
let g:jsx_ext_required = 0
NeoBundle 'ternjs/tern_for_vim' " do `npm i` at `~/.vim/bundle/tern_for_vim`
let g:tern_show_signature_in_pum = 1
NeoBundle 'nvie/vim-flake8'
NeoBundle 'tell-k/vim-autopep8'
autocmd BufWritePost  *.py call Autopep8()
autocmd BufWritePost *.py call Flake8()
let g:autopep8_disable_show_diff=1
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0 " do npm i -g instant-markdown-d

NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'elmcast/elm-vim'
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
autocmd FileType elm nmap <leader>m <Plug>(elm-make)
autocmd FileType elm nmap <leader>M <Plug>(elm-make-main)
autocmd FileType elm nmap <leader>d <Plug>(elm-error-detail)
autocmd BufWritePost *.elm ElmMake

NeoBundle 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery,underscore,angular,react,jasmine,chai'

" misc
NeoBundle 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0
NeoBundle 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'javascript': { 'left': '//', 'leftAlt': '/**','rightAlt': '*/' } }
NeoBundle 'junegunn/vim-peekaboo'
NeoBundle 'AndrewRadev/linediff.vim' " :LineDiff()

NeoBundle 'gko/vim-coloresque'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

NeoBundle 'vimwiki/vimwiki'
NeoBundle 'w0rp/ale'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_fixers = {
  \   'javascript': [ 'prettier', 'eslint' ],
  \   'python': [ 'autopep8' ],
  \   'haskell': [ 'hfmt' ],
  \   'typescript': [ 'prettier', 'tslint' ],
  \   'elm': [ 'elm-format', 'elm-make' ]
  \}
let g:ale_linters = {
  \   'javascript': [ 'prettier', 'eslint' ],
  \   'python': [ 'autopep8' ],
  \   'haskell': [ 'hfmt' ],
  \   'typescript': [ 'prettier', 'tslint' ],
  \   'elm': [ 'elm-format', 'elm-make' ]
  \}
nnoremap <leader>d :ALEDetail<cr>
autocmd! BufWritePre *.js,*.ts,*.tsx,*.hs :ALEFix
NeoBundle 'wellle/visual-split.vim'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'jceb/vim-editqf'
let g:editqf_jump_to_error = 0
NeoBundle 'simnalamburt/vim-mundo'
nnoremap <F6> :MundoToggle<CR>
let g:mundo_prefer_python3 = 1
let g:mundo_auto_preview = 0
let g:mundo_return_on_revert = 0


NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'geekjuice/vim-mocha'
let g:mocha_js_command = "!mocha --recursive --reporter list --compilers js:./node_modules/babel-core/register {spec}"

NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '/': { 'pattern': '//\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
\ }

" eyecandy
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233
NeoBundle 'RRethy/vim-illuminate'

NeoBundle 'gertjanreynaert/cobalt2-vim-theme'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'thiagoalessio/rainbow_levels.vim'
let g:rainbow_levels = [
    \{'ctermfg': 2, 'guifg': '#859900'},
    \{'ctermfg': 6, 'guifg': '#2aa198'},
    \{'ctermfg': 4, 'guifg': '#268bd2'},
    \{'ctermfg': 5, 'guifg': '#6c71c4'},
    \{'ctermfg': 1, 'guifg': '#dc322f'},
    \{'ctermfg': 3, 'guifg': '#b58900'},
    \{'ctermfg': 8, 'guifg': '#839496'},
    \{'ctermfg': 7, 'guifg': '#586e75'}]

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()
