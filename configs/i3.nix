{ pkgs, lib, ... }: {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod1";
      gaps = {
        inner = 10;
        outer = 10;
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec alacritty";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+H" = "move left";
        "${modifier}+Shift+J" = "move down";
        "${modifier}+Shift+K" = "move up";
        "${modifier}+Shift+L" = "move right";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+v" = "split v";
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+Shift+f" = "floating toggle";
        "${modifier}+a" = "focus parent";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "XF86MonBrightnessDown" = "exec xbacklight -dec 10";
        "XF86MonBrightnessUp" = "exec xbacklight -inc 10";
        "Print" = "exec --no-startup-id maim /home/unsoundsystem/Pictures/screenshot`date '+%y%m%d%H%M'`.png";
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";
        "${modifier}+x" = "[floating] move scratchpad";
        "${modifier}+i" = "exec alacritty -e 'ranger'";
        "${modifier}+t" = "exec alacritty -e 'bpytop'";
      };

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/.wallpaper";
          always = true;
          notification = false;
        }
        {
          command = "fcitx &";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
