{ env, pkgs, ... }:
{
  services.polybar = {
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };
    enable = true;
    script = "sh ~/.config/polybar/cuts/launch.sh";
  };
}
