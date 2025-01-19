{ pkgs }:

pkgs.symlinkJoin {
  name = "yabai-deps";
  paths = with pkgs; [
    skhd
  ];
}

