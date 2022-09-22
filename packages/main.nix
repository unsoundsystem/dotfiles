{ env, config, pkgs, ... }:

{
  home.packages = with pkgs; [

    feh
    arandr
    nodejs
    arion
    docker-client
    rustup
    gcc
    mendeley
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
    navi
    xclip
    xsel

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
    polymc

    # IDE
    jetbrains.idea-community
    #oni2

    # Chat
    element-desktop
    discord
  ];
}

