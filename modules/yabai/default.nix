{ pkgs }:

pkgs.symlinkJoin {
  name = "yabai-deps";
  paths = with pkgs; [
    yabai
    sketchybar  # send signal to sketchybar
  ];
}
