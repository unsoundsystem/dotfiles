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
    zathura
    baobab
    vscode
    xfce.thunar
    picom

    # Terminal Emulator
    kitty

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
    ripgrep
    jq
    trash-cli
    ctags
    gh

    # Fonts
    iosevka
    monoid
    nerdfonts
    ibm-plex
    ipafont
    hack-font
    rictydiminished-with-firacode

    # Games
    minecraft
    steam
    multimc

    # IDE
    jetbrains.idea-community

    # Chat
    element-desktop
  ];
}

