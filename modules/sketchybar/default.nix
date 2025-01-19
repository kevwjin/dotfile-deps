{ pkgs }:

pkgs.symlinkJoin {
  name = "sketchybar-deps";
  paths = with pkgs; [
    sketchybar
    yabai         # receive yabai signal
  ];
}
