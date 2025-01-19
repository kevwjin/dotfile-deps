{ pkgs }:

pkgs.symlinkJoin {
  name = "tmux-deps";
  paths = with pkgs; [
    tmux
    tmuxPlugins.continuum   # includes tmux resurrect as dependency
  ];
}
