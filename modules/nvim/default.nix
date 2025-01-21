{ pkgs }:

pkgs.symlinkJoin {
  name = "nvim-deps";
  paths = with pkgs; [
    fzf                           # for telescope.nvim
    unzip                         # for telescope.nvim and fzf
    libgcc                        # for c-family lsps
    gnumake                       # for c-family lsps
    nodejs_22                     # for js-family lsps
    python3                       # for pyright
    python312Packages.pip         # for pyright
    cargo                         # for nil (nix lsp)
    lazygit                       # for lazygit.nvim
  ];
}
