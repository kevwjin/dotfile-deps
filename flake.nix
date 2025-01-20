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
            (import ./modules/zsh {
              inherit pkgs;
              oh-my-zsh = pkgs.fetchFromGitHub {
                owner = "ohmyzsh";
                repo = "ohmyzsh";
                rev = "6e9cda3d30d8e73c11e4d32044b7f4c5e06f822d";
                sha256 = "1ldzdfdjk0fgvrsyfj9bpijczdwag8315jya85qjpb1z23wzf1xm";
              };
            })
            (import ./modules/ssh { inherit pkgs; })
            (import ./modules/git { inherit pkgs; })
            (import ./modules/rbw { inherit pkgs; })
          ];
        };
      });
}
