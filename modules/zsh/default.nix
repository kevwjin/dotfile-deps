{ pkgs, stdenv }:

pkgs.symlinkjoin {
  name = "zsh-deps";
  paths = with pkgs; [
    oh-my-zsh
    zsh-powerlevel10k   # to interpret .p10k.zsh theme
    coreutils           # to alias gls to ls
    chezmoi             # to alias chezmoi to cm; chezmoi called in zprofile
    git                 # to alias chezmoi to cm; git called in zprofile
    neovim              # to alias neovim to nv
  ] ++
  # since zsh comes with macos by default, only install zsh in non-darwin envs
  (if !stdenv.isdarwin then [ pkgs.zsh ] else []);
}
