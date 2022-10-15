{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
  self = rec {
    nodeenv-shark = pkgs.callPackage ./pkgs/dev/nodeenv-shark {
      inherit (pkgs) stdenv pythonPackages;
    };

    paperwm = pkgs.callPackage ./pkgs/desktops/gnome/extensions/paperwm {
      inherit (pkgs) stdenv;
    };
  };
in self
