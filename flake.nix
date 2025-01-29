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
          paths = with pkgs; [
            hello
            neofetch

            # cli utils
            uutils-coreutils-noprefix
            openssh
            age
            git
            chezmoi
            tree
            jq                          # used in yabai
            gnutar
            ripgrep
            fd
            aider-chat

            # zsh config deps
            zsh
            direnv
            oh-my-zsh
            zsh-powerlevel10k

            # nvim config deps
            neovim
            fzf                         # for telescope.nvim
            unzip                       # for telescope.nvim and fzf
            libgcc                      # for c-family lsps
            gnumake                     # for c-family lsps
            nodejs_22                   # for js-family lsps
            python3                     # for pyright
            python312Packages.pip       # for pyright
            cargo                       # for nil (nix lsp)
            lazygit                     # for lazygit.nvim

            # tmux config deps
            tmux
            tmuxPlugins.continuum       # includes tmux resurrect

            # rbw deps
            rbw
            pinentry-tty

          ];
        };
      });
}
