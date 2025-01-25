The flake.nix is used to install and document all package dependencies for the dotfiles in the [kevwjin/dotfiles](https://github.com/kevwjin/dotfiles) repo. Dependencies are clarified via inline comments. For example, this snippet from the flake.nix shows my Zsh dependencies:
```flake.nix
# zsh config deps
zsh
direnv
oh-my-zsh
zsh-powerlevel10k
```
