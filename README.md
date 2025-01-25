The flake.nix is used to install and document package dependencies for the dotfiles in the [kevwjin/dotfiles](https://github.com/kevwjin/dotfiles) repo. For example, this snippet from the flake.nix shows my Zsh dependencies:
```flake.nix
# zsh config deps
zsh
direnv
oh-my-zsh
zsh-powerlevel10k
```
> Note that Yabai, Skhd, and Sketchybar dependencies are not contained in the flake.nix. I believe managing them with the brew package manager on MacOS allows for more ease of use and separation of concerns; not to mention that SIP must be disabled for these window management tools to function properly (and nix-darwin cannot disable SIP).

To use this repo with the [dotfiles](https://github.com/kevwjin/dotfiles) repo, first install Nix if you have not done so. I recommend following the official documentation of the Nix organization at https://nix.dev/install-nix.html. Once Nix is installed on your system and flakes are enabled, 1) clone this repo and 2) move the flake.nix to `~/.config/nix`. In case you have other Nix profiles, note that the `nix profile upgrade --all` command is in the `dot_zprofile` file in the [dotfiles](https://github.com/kevwjin/dotfiles) repo, which means that upon opening a Zsh login shell, the command will be run each time a change in the remote GitHub repo is detected.
