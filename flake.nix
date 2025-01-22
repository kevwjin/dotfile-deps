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

# # TODO: PART TO COMBINE
# let
#   zshrcPath = "${config.home.homeDirectory}/.zshrc";
#   # wrap p10k and zshrc
#   wrappedZshrc = pkgs.writeText "wrapped-zshrc" ''
#     # setup dir env with direnv
#     emulate ${pkgs.zsh}/bin/zsh -c \
#       "$(${pkgs.direnv}/bin/direnv export zsh)"
#
#     # prompt user while shell loading:
#       # define cache path
#       # source instant prompt if readable
#     local CACHE_FILE="''${XDG_CACHE_HOME:-''$HOME/.cache}"
#     CACHE_FILE+="/p10k-instant-prompt-''${(%):-%n}.zsh"
#     [[ -r "''$CACHE_FILE" ]] && source "''$CACHE_FILE"
#
#     # enable direnv hook (e.g., when changing dir)
#     emulate ${pkgs.zsh}/bin/zsh -c \
#       "$(${pkgs.direnv}/bin/direnv hook zsh)"
#
#     # source p10k and zshrc
#     source \
#       ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
#     source ${config.home.homeDirectory}/.zshrc
#   '';
# in {
#   ".zshrc".source = wrappedZshrc;
# }

