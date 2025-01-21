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
          name = "dotfile-pkgs";
          paths = [
            # dotfile config deps
            (import ./modules/nvim { inherit pkgs; })
            (import ./modules/tmux { inherit pkgs; })
            (import ./modules/zsh { inherit pkgs; })
            (import ./modules/ssh { inherit pkgs; })
            pkgs.chezmoi
            pkgs.git
            pkgs.rbw

            # additional tools
            pkgs.coreutils
            pkgs.ripgrep
            pkgs.fd
            pkgs.jq         # used in yabai
            pkgs.tree
            pkgs.gnutar
            pkgs.direnv
          ];
        };
      });
}
