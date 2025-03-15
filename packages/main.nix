{ config, pkgs, ... }:

let env = import ../install_env.nix; in
let add_list_if = x: ls: if x then ls else []; in
{
  home.packages = with pkgs; [

    #earthly
    clang-tools
    kubectl
    krew
    feh
    arandr
    nodejs
    arion
    docker-client
    #mendeley
    #jdk
    zathura
    baobab
    vscode
    xfce.thunar
    #picom
    wireshark
    #wireshark-cli

    # Terminal Emulator
    kitty
    st

    # Browser
    firefox
    vivaldi
    vivaldi-ffmpeg-codecs

    # Screenshot
    maim
    
    # CLI Utilities
    ghq
    fzf
    neofetch
    tree
    htop
    iotop
    btop
    duf
    du-dust
    bat
    ranger
    file
    vagrant
    hub
    ripgrep
    jq
    trash-cli
    ctags
    gh
    navi
    xclip
    xsel

    # Fonts
    #iosevka
    monoid
    #nerdfonts
    #ibm-plex
    ipafont
    hack-font
    rictydiminished-with-firacode

    # Games
    #minecraft
    #steam
    #polymc

    # IDE
    jetbrains.idea-community
    #oni2
    neovide

    # Chat
    element-desktop
    discord
  ] ++ (add_list_if (!env.archlinux-desktop) (with pkgs;[ rustup gcc ]));
}

