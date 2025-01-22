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
        
        # Create the wrapped zshrc
        wrappedZshrc = pkgs.writeText "wrapped-zshrc" ''
          # Set ZSH path for oh-my-zsh first
          export ZSH="${pkgs.oh-my-zsh}/share/oh-my-zsh"
          
          # Set theme before sourcing oh-my-zsh
          ZSH_THEME="powerlevel10k/powerlevel10k"
          
          # Source oh-my-zsh before any other configurations
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
          
          # setup dir env with direnv
          emulate ${pkgs.zsh}/bin/zsh -c \
            "$(${pkgs.direnv}/bin/direnv export zsh)"
          
          # prompt user while shell loading
          local CACHE_FILE="''${XDG_CACHE_HOME:-$HOME/.cache}"
          CACHE_FILE+="/p10k-instant-prompt-''${(%):-%n}.zsh"
          [[ -r "''$CACHE_FILE" ]] && source "''$CACHE_FILE"
          
          # enable direnv hook
          emulate ${pkgs.zsh}/bin/zsh -c \
            "$(${pkgs.direnv}/bin/direnv hook zsh)"
          
          # Source p10k configuration if it exists
          [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
          
          # Finally source user's zshrc LAST
          source ~/.zshrc
        '';

        # derivation to install wrapped zshrc
        zshrcPackage = pkgs.stdenv.mkDerivation {
          name = "zshrc-config";
          src = pkgs.emptyFile;  # Add empty source
          
          buildInputs = with pkgs; [
            zsh
            direnv
            zsh-powerlevel10k
            oh-my-zsh
          ];
          
          # Skip unpack phase since we don't need any source files
          dontUnpack = true;
          
          # No build phase needed
          dontBuild = true;
          
          # Install phase copies the wrapped zshrc to the output
          installPhase = ''
            mkdir -p $out/etc
            cp ${wrappedZshrc} $out/etc/zshrc
          '';
        };
        
      in
      {
        packages.default = pkgs.symlinkJoin {
          name = "dotfile-pkgs";
          paths = with pkgs; [
            # Add the zshrc package to the existing packages
            zshrcPackage
            
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
            # zsh config deps
            zsh
            direnv
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
          ];
        };
      });
}
