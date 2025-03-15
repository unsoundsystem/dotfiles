{ config, pkgs, lib, ... }:

let env = import ../install_env.nix; in
let add_list_if = x: ls: if x then ls else []; in
let add_str_if = x: str: if x then str else ''''; in
{
  imports = (add_list_if (!env.archlinux-desktop) [ ./i3.nix ./alacritty.nix ])
    ++ [
      ./neovim/neovim.nix
      ./xdg.nix
      #./picom.nix
      ./rofi.nix
      ./dunst.nix
      #./polybar.nix
    ];

  fonts.fontconfig.enable = true;
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;
      ignores = [ "*~" "*.swp" "result" ];
      userEmail = "unsoundsystem@protonmail.com";
      userName = "unsoundsystem";
    };
 

    fish = {
      enable = true;
      plugins = [
        {
          name = "fish-ghq";
          src = pkgs.fetchFromGitHub {
            owner = "decors";
            repo = "fish-ghq";
            rev = "cafaaabe63c124bf0714f89ec715cfe9ece87fa2";
            sha256 = "0cv7jpvdfdha4hrnjr887jv1pc6vcrxv2ahy7z6x562y7fd77gg9";
          };
        }
        {
          name = "plugin-foreign-env";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-foreign-env";
            rev = "b3dd471bcc885b597c3922e4de836e06415e52dd";
            sha256 = "3h03WQrBZmTXZLkQh1oVyhv6zlyYsSDS7HTHr+7WjY8=";
          };
        }
      ];

      shellInit =
        ''
          set fish_greeting
          fish_vi_key_bindings
          fenv source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
          set PATH $PATH /home/unsoundsystem/.nix-profile/bin
          direnv hook fish | source
        '' + add_str_if (env.archlinux-desktop)
        ''
        source /usr/share/doc/find-the-command/ftc.fish

        # opam configuration
        source /home/unsoundsystem/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
        '';
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
      };
    };

    tmux = {
      enable = true;
      extraConfig = ''
        # prefixキーをC-aに変更する
        set -g prefix C-a

        # C-bのキーバインドを解除する
        unbind C-b

        # キーストロークのディレイを減らす
        set -sg escape-time 1

        # ウィンドウのインデックスを1から始める
        set -g base-index 1

        # ペインのインデックスを1から始める
        setw -g pane-base-index 1

        # 設定ファイルをリロードする
        bind r source-file ~/.tmux.conf \; display "Reloaded!"

        # C-a*2でtmux内のプログラムにC-aを送る
        bind C-a send-prefix

        # | でペインを縦に分割する
        bind | split-window -h -c '#{pane_current_path}'

        # - でペインを横に分割する
        bind - split-window -v -c '#{pane_current_path}'

        # Vimのキーバインドでペインを移動する
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        bind -r C-h select-window -t :-
        bind -r C-l select-window -t :+

        # Vimのキーバインドでペインをリサイズする
        bind -r H resize-pane -L 5
        bind -r J resize-pane -D 5
        bind -r K resize-pane -U 5
        bind -r L resize-pane -R 5

        # マウス操作を有効にする
        setw -g mouse on

        # 256色端末を使用する
        set -g default-terminal "screen-256color"

        #コピーモードを設定する
        ## viのキーバインドを使用する
        setw -g mode-keys vi

        #スクロールバッファ
        set-option -g history-limit 100000
      '';
    };

    #opam.enable = true;

    direnv = {
        enable = true;
        nix-direnv.enable = true;
    };
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-mozc ];
  };

  xsession.enable = true;

}
