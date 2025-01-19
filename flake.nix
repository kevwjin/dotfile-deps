{
  description = "Dotfile dependencies";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "dotfile-deps";
          paths = [
            (import ./modules/nvim { inherit pkgs; })
            (import ./modules/tmux { inherit pkgs; })
            (import ./modules/zsh { inherit pkgs; })
            (import ./modules/ssh { inherit pkgs; })
            (import ./modules/git { inherit pkgs; })
            (import ./modules/bitwarden-cli { inherit pkgs; })
          ];
        };
      });
}
