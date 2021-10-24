{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    git
    feh
    arandr
    nodejs
    arion
    docker-client
    rustup
    gcc
    mendeley
    jdk

    # Terminal Emulator
    alacritty

    # Browser
    firefox
    vivaldi
    vivaldi-ffmpeg-codecs

    # Screenshot
    maim
    
    # CLI Utilities
    ghq
    direnv
    fzf
    neofetch
    tree
    htop
    bpytop
    duf
    dust
    bat
    ranger
    file
    vagrant
    hub

    # Fonts
    iosevka
    monoid
    nerdfonts
    ibm-plex
    ipafont
    hack-font

    # Games
    minecraft

    # IDE
    jetbrains.idea-community
  ];
}

