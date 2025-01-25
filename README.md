The flake.nix is used to install and document all package dependencies for the dotfiles in the [kevwjin/dotfiles](https://github.com/kevwjin/dotfiles) repo. Dependencies are documented via inline comments. For example, the snippet below shows my Zsh dependencies:
```flake.nix
# zsh config deps
zsh
direnv
oh-my-zsh
zsh-powerlevel10k
```
