The flake.nix is used to install and document package dependencies for the dotfiles in the [kevwjin/dotfiles](https://github.com/kevwjin/dotfiles) repo. For example, this snippet from the flake.nix shows my Zsh dependencies:
```flake.nix
# zsh config deps
zsh
direnv
oh-my-zsh
zsh-powerlevel10k
```
> Note that Yabai, Skhd, and Sketchybar dependencies are not contained in the flake.nix. I believe managing them with the brew package manager on MacOS allows for more ease of use and separation of concerns; not to mention that SIP must be disabled for these window management tools to function properly (and nix-darwin cannot disable SIP).
