{ pkgs, lib, ... }:
{
  #nixpkgs.overlays = [
  #  (import (builtins.fetchTarball {
  #    url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #  }))
  #];

  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./dein_install.vim)

      ''
        "dein Scripts-----------------------------
        if &compatible
          set nocompatible               " Be iMproved
        endif

        let s:dein_base = '~/.cache/dein/'
        let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

        " Required:
        set runtimepath+=/home/unsoundsystem/.dein/repos/github.com/Shougo/dein.vim

        " Required:
        call dein#begin(s:dein_base)

        " Let dein manage dein
        " Required:
        call dein#add(s:dein_src)

        " Required:
        call dein#end()

        if dein#load_state(s:dein_base)
            call dein#begin(s:dein_base)
            call dein#load_toml('${./plugins}/dein.toml', {'lazy': 0})
            call dein#load_toml('${./plugins}/dein_lazy.toml', {'lazy': 1})
            call dein#end()
            call dein#save_state()
        endif
      ''

      ''
        "Template directory
        let g:sonictemplate_vim_template_dir = '${./templates}'

        "coc.nvim config directory
        let g:coc_config_home = '${./coc-nvim}'
      ''

      (lib.strings.fileContents ./init.vim)
    ];

    viAlias = true;
    vimAlias = true;
    #package = pkgs.neovim;

    extraPackages = (with pkgs; [
      # rnix-lsp isabelle
      haskell-language-server ccls 
      fzf ripgrep
      silver-searcher perl ctags ocamlformat
      #dhall-lsp-server
      python39
      metals xclip xsel
    ])
    ++ (with pkgs.ocamlPackages;
        [ ocaml-lsp merlin ])
    #++ (with pkgs.nodePackages;
    #[ purescript-language-server ])
    ;

    extraPython3Packages = (ps: with ps; [ pynvim ]);
  };
}
