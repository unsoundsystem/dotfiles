{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''
        "Dein 
        "dein Scripts-----------------------------
        if &compatible
          set nocompatible               " Be iMproved
        endif

        " Required:
        set runtimepath+=/home/unsoundsystem/.dein/repos/github.com/Shougo/dein.vim

        " Required:
        call dein#begin('/home/unsoundsystem/.dein')

        " Let dein manage dein
        " Required:
        call dein#add('/home/unsoundsystem/.dein/repos/github.com/Shougo/dein.vim')

        " Required:
        call dein#end()

        if dein#load_state('/home/unsoundsystem/.cache/.dein')
            call dein#begin('/home/unsoundsystem/.cache/.dein')
            call dein#load_toml('${./plugins/dein.toml}', {'lazy': 0})
            call dein#load_toml('${./plugins/dein_lazy.toml}', {'lazy': 1})
            call dein#end()
            call dein#save_state()
        endif


        " Required:
        filetype plugin indent on
        syntax enable

        " If you want to install not installed plugins on startup.
        "if dein#check_install()
        "  call dein#install()
        "endif

        "End dein Scripts-------------------------

        filetype plugin indent on

        if &compatible
          set nocompatible
        endif

        syntax enable
        set background=dark
        set nopaste
        set nu rnu
        set clipboard=unnamedplus
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
        nn <C-i><C-i> :source ~/.vimrc<CR><Esc> 
        nn <C-o><C-o> :e ~/.vimrc<CR><Esc> 
        nn <C-b><C-b> :bn<CR><Esc>
        nn <C-b><C-p> :bp<CR><Esc>
        let mapleader = " "
        tnoremap <C-T><C-N> <C-\><C-n>

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
            au BufNewFile,BufRead *.v setfiletype verilog
            au BufNewFile,BufRead *.fs setfiletype fsharp
            au BufNewFile,BufRead *.yara setfiletype yara
            au BufNewFile,BufRead *.thy setfiletype isabelle
            au BufNewFile,BufRead *.agda setfiletype agda
            au BufNewFile,BufRead *.c,*.cpp,*.cxx,*.h,*.hpp setlocal noexpandtab ts=4 shiftwidth=4
            au BufNewFile,BufRead *.ts setlocal ts=2 shiftwidth=2
        augroup END
      '';
    viAlias = true;
    vimAlias = true;
  };
}
