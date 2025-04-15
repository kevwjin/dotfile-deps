The flake.nix is used to install and document package dependencies for the dotfiles in the [kevwjin/dotfiles](https://github.com/kevwjin/dotfiles) repo. For example, this snippet from the flake.nix shows my Zsh dependencies:
```flake.nix
# zsh config deps
zsh
direnv
oh-my-zsh
zsh-powerlevel10k
```
CLI utils and the rust rewrite of Bitwarden, rbw, are also contained in the flake.

> Note that Yabai, Skhd, and Sketchybar dependencies are not contained in the flake.nix. @kevwjin believes managing them with Homebrew on MacOS allows for more ease of use and separation of concerns; not to mention that SIP must be disabled for these window management tools to function properly (and nix-darwin cannot disable SIP).

To use this repo with the [kevwjin/dotfiles](https://github.com/kevwjin/dotfiles) repo, first install Nix if you have not done so. @kevwjin recommends following the official documentation of the Nix organization at [https://nix.dev/install-nix.html](https://nix.dev/install-nix.html). Once Nix is installed on your system and flakes are enabled, 1) clone this repo and 2) rename the repo to `$HOME/.config/nix`.

> In case you have other Nix profiles, note that the `nix profile upgrade --all` command is in the [`dot_zprofile`](https://github.com/kevwjin/dotfiles/blob/main/dot_zprofile) file, which means that upon opening a Zsh login shell, the command will be run each time a change in the remote GitHub repo is detected.
