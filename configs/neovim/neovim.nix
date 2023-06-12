{ pkgs, lib, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    extraConfig = builtins.concatStringsSep "\n" [
      ''
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
            call dein#load_toml('${./plugins}/dein.toml', {'lazy': 0})
            call dein#load_toml('${./plugins}/dein_lazy.toml', {'lazy': 1})
            call dein#end()
            call dein#save_state()
        endif

        " Required:
        filetype plugin indent on
        syntax enable

        " If you want to install not installed plugins on startup.
        if dein#check_install()
          call dein#install()
        endif

        "End dein Scripts-------------------------

        "Template directory
        let g:sonictemplate_vim_template_dir = '${./templates}'

        "coc.nvim config directory
        let g:coc_config_home = '${./coc-nvim}'
      ''
      (lib.strings.fileContents ./init.vim)
    ];

    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;

    extraPackages = (with pkgs; [
      rnix-lsp # isabelle
      haskell-language-server ccls 
      fzf ripgrep-all
      silver-searcher perl ctags ocamlformat
      dhall-lsp-server python39
      metals xclip xsel
    ])
    ++ (with pkgs.ocamlPackages;
        [ ocaml-lsp merlin ])
    ++ (with pkgs.nodePackages;
        [ purescript-language-server ]);

    extraPython3Packages = (ps: with ps; [ pynvim ]);
  };
}
