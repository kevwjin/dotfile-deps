{ pkgs }:

pkgs.symlinkJoin {
  name = "nvim-deps";
  paths = with pkgs; [
    neovim
    fzf                           # for telescope.nvim
    unzip                         # for telescope.nvim and fzf
    gcc                           # for c-family lsps
    gnumake                       # for c-family lsps
    nodejs_20                     # for js-family lsps
    nodePackages.npm              # for js-family lsps
    python3                       # for pyright
    python3Packages.pip           # for pyright
  ];
}
