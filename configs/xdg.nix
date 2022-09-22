{ config, pkgs, ... }:
{

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
    };
  };

  xdg.desktopEntries = {
    thunar = {
      name = "thunar";
      genericName = "File Manager";
      exec = "thunar %U";
      terminal = false;
      mimeType = [ "inode/directory" ];
    };
  };

}
