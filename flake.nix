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
          config = {
            allowUnfree = true;
          };
        };

      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "dotfile-pkgs";
          paths = with pkgs; [
            hello
            neofetch

            # cli utils
            coreutils
            openssh
            age
            git
            chezmoi
            tree
            jq                          # used in yabai
            gnutar
            ripgrep
            fd
            jellyfin-ffmpeg
            postgresql
            claude-code
            yt-dlp
            ffmpeg

            # zsh config deps
            zsh
            direnv
            oh-my-zsh
            zsh-powerlevel10k

            # nvim config deps
            neovim
            fzf                         # for telescope.nvim
            unzip                       # for telescope.nvim and fzf
            lazygit                     # for lazygit.nvim
            libgcc                      # for c-family lsps
            gnumake                     # for c-family lsps
            nodejs_22                   # for js-family lsps
            python3                     # for pyright
            python312Packages.pip       # for pyright
            cargo                       # for nix lsp
            zls

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
