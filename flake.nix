{
  description = "Dotfile dependencies";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    powerlevel10k = {
      url = "github:romkatv/powerlevel10k";
      flake = false;
    };
  };
  
  outputs = { self, nixpkgs, flake-utils, powerlevel10k }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "dotfiles";
          paths = [
            (import ./modules/nvim { inherit pkgs; })
            (import ./modules/tmux { inherit pkgs; })
            (import ./modules/yabai { inherit pkgs; })
            (import ./modules/skhd { inherit pkgs; })
          ];
        };
      });
}
