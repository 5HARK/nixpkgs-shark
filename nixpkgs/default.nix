{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
  self = rec {
    nodeenv-shark = pkgs.callPackage ./pkgs/dev/nodeenv-shark {
      inherit (pkgs) stdenv pythonPackages;
    };
  };
in self
