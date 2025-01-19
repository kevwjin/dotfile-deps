{ pkgs }:

pkgs.symlinkJoin {
  name = "nvim-deps";
  paths = with pkgs; [
    neovim
    fzf                           # for telescope.nvim
    unzip                         # for telescope.nvim and fzf
    libgcc                        # for c-family lsps
    gnumake                       # for c-family lsps
    nodejs_22                     # for js-family lsps
    python312Packages.python      # for pyright
    python312Packages.pip         # for pyright
  ];
}
