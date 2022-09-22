{ config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "unsoundsystem";
  home.homeDirectory = "/home/unsoundsystem";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  env = (imoprt ./install_env.nix);
  # write in install_env.nix at toplevel
  #{
    #nixos-desktop = false;
    #archlinux-desktop = true;
  #};

  imports = [ (./configs/main.nix env) (./packages/main.nix env) ];
}
