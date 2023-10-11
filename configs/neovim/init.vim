
"Uncomment only when uninstalling.
"call map(dein#check_clean(), "delete(v:val, 'rf')")

set background=dark
set nopaste
set nu rnu
set clipboard+=unnamedplus
set hidden
set nobackup
set tags=./tags;,tags;
packadd termdebug
colorscheme gruvbox

set mouse=n
set ts=1
set shiftwidth=4
set expandtab
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set undofile
set splitbelow
nn tn :tabnew 
let mapleader = " "
tnoremap <C-T><C-N> <C-\><C-n>
set cursorline

set undodir=~/.config/nvim/undo
set viminfo+='1000,\"1000,s1000,:1000,n~/.config/nvim/viminfo

" coc-snippet settings
" Use <C-l> for trigger snippet expand.
imap <Tab> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
      'toml',
    }
  }
}
EOF

" lua <<EOF
" require 'nvim-startup'.setup()
" EOF

"glyph-pallete
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"filetypes
augroup vimrc
    au!
    au BufNewFile,BufRead *.jl setfiletype julia
    au BufNewFile,BufRead *.nix setfiletype nix
    au BufNewFile,BufRead *.zen  setfiletype zen
    au BufNewFile,BufRead *.csv setfiletype csv
    au BufNewFile,BufRead *.lds setfiletype ld
    au BufNewFile,BufRead *.nasm setfiletype nasm
    au BufNewFile,BufRead *.ino setfiletype arduino
    au BufNewFile,BufRead *.smi setfiletype sml
    "au BufNewFile,BufRead *.v setfiletype verilog
    au BufNewFile,BufRead *.v set ft=coq
    au BufNewFile,BufRead *.fs setfiletype fsharp
    au BufNewFile,BufRead *.yara setfiletype yara
    au BufNewFile,BufRead *.thy setfiletype isabelle
    au BufNewFile,BufRead *.agda setfiletype agda
    au BufNewFile,BufRead *.purs setfiletype purescript
    au BufNewFile,BufRead *.dhall setfiletype dhall
    au BufRead,BufNewFile Earthfile set filetype=Earthfile
    au BufRead,BufNewFile build.earth set filetype=Earthfile
    au BufNewFile,BufRead *.c,*.cpp,*.cxx,*.h,*.hpp setlocal noexpandtab ts=4 shiftwidth=4
    au BufNewFile,BufRead *.ts setlocal ts=2 shiftwidth=2
augroup END

"Utilities
command Config :cd ~/.config/nixpkgs/configs/neovim | :e init.vim
