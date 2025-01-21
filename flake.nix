{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      sdl3 = pkgs.stdenv.mkDerivation {
        name = "sdl3";
        src = ./.;
        nativeBuildInputs = [
          pkgs.cmake
          pkgs.pkg-config
        ];
        buildInputs = [
          pkgs.libGL 
          pkgs.xorg.libX11
          pkgs.xorg.libX11 
          pkgs.xorg.libXcursor 
          pkgs.xorg.libXi 
          pkgs.xorg.libxcb  
          pkgs.libxkbcommon 
          pkgs.libglvnd
        ];
      };
    in {
      packages.x86_64-linux.default = sdl3;
    };
}
