{ pkgs }:

pkgs.symlinkJoin {
  name = "zsh-deps";
  paths = with pkgs; [
    zsh
    coreutils           # to alias gls to ls
    chezmoi             # to alias chezmoi to cm; chezmoi called in zprofile
    git                 # to alias chezmoi to cm; git called in zprofile
    rbw                 # to alias rbw to w
    neovim              # to alias neovim to nv
  ];
}
