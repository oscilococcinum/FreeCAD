{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs: {
    packages = builtins.listToAttrs (map (system:
      {
        name = system;
        value = with import nixpkgs { inherit system; config.allowUnfree = true;}; rec {

          freecad-appimage = pkgs.callPackage (import ./package/nix) { };

          freecadrt-appimage = pkgs.callPackage (import ./package/nix/realthunder.nix) { };

          default = freecad-appimage;
        };
      }
    )[ "x86_64-linux" ]);
  };
}
