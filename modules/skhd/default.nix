{ pkgs }:

pkgs.symlinkJoin {
  name = "yabai-deps";
  paths = with pkgs; [
    skhd
    yabai   # skhd calls yabai commands
  ];
}

