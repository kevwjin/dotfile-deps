The flake.nix can be used to install all dependencies of the kevwjin/dotfiles repo. For dotfile dependency details, please refer to the inline comments in flake.nix. For instance, to find the dependency for my zsh config refer to this snippet of the flake.nix.
```flake.nix
# zsh config deps
zsh
direnv
oh-my-zsh
zsh-powerlevel10k
```
