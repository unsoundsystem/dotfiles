- add following lines in home.nix

```
env = { nixos-desktop = false; archlinux-desktop = true; };
imports = [ (./configs/main.nix env) (./packages/main.nix env) ];
```
