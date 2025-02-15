{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    appimage-file-weekly = {
      url = "https://github.com/FreeCAD/FreeCAD-Bundle/releases/download/weekly-builds/FreeCAD_weekly-builds-40253-conda-Linux-x86_64-py311.AppImage";
      flake = false;
    };
    appimage-file-rt = {
      url = "https://github.com/realthunder/FreeCAD/releases/download/20241003stable/FreeCAD-Link-Stable-Linux-x86_64-py3.11-20241003.AppImage";
      flake = false;
    };
    astocad-repo = {
      type = "git";
      url = "https://github.com/AstoCAD/FreeCAD";
      ref = "AstoCAD";
      submodules = true;
      flake = false;
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    packages = builtins.listToAttrs (map (system: {
        name = system;
        value = with import nixpkgs { inherit system; config.allowUnfree = true;}; rec {

          freecad-appimage = pkgs.callPackage (import ./package/nix/weekly.nix) { src-flake = inputs.appimage-file-weekly; };

          freecadrt-appimage = pkgs.callPackage (import ./package/nix/realthunder.nix) { src-flake = inputs.appimage-file-rt; };

          astocad = pkgs.callPackage (import ./package/nix/default.nix) { src-flake = inputs.astocad-repo; };

          default = freecad-appimage;
        };
      })[ "x86_64-linux" ]);
  };
}
